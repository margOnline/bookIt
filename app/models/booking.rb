class Booking < ActiveRecord::Base
  
  belongs_to :resource

  validates :start_time, presence: true 
  validates :length, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :overlaps

  before_validation :calculate_end_time

  scope :end_during, ->(new_start_time, new_end_time) do
    where(end_time: new_start_time...new_end_time)
  end

  scope :start_during, ->(new_start_time, new_end_time) do
    where(start_time: new_start_time...new_end_time)
  end

  scope :happening_during, ->(new_start_time, new_end_time) do
    where('start_time > ? AND end_time < ?', new_start_time, new_end_time)
  end

  scope :enveloping, ->(new_start_time, new_end_time) do
    where('start_time < ? AND end_time > ?', new_start_time, new_end_time)
  end

  def overlaps
    overlapping_bookings = [ 
      resource.bookings.end_during(start_time, end_time),
      resource.bookings.start_during(start_time, end_time),
      resource.bookings.happening_during(start_time, end_time),
      resource.bookings.enveloping(start_time, end_time)
    ].flatten

    overlapping_bookings.delete self
    if overlapping_bookings.any?
      errors.add(:base, 'Slot has already been booked')
    end
  end

  def start_date_cannot_be_in_the_past
    if start_time && start_time < DateTime.now
      errors.add(:start_time, 'can\'t be in the past')
    end
  end

  def calculate_end_time
    start_time = self.start_time
    length = self.length.to_i
    self.end_time = start_time + length.hours
  end

  def as_json(options = {})  
   {  
    :id => self.id,  
    :start => self.start_time,  
    :end => self.calculate_end_time,  
    :recurring => false, 
    :allDay => false
   }  
  end  

end