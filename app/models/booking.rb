class Booking < ActiveRecord::Base
  
  belongs_to :resource

  validates :start_time, presence: true 
  validates :length, presence: true
  validate :start_date_cannot_be_in_the_past

   before_validation :calculate_end_time

  # scope :start_time_booked, lambda {|new_start_time, new_end_time| 
  #   {:conditions => "start_time > #{new_start_time} and start_time <= #{new_end_time}" }
  #   }

  # scope :end_time_booked, lambda {|new_start_time, new_end_time| 
  #   {:conditions => "end_time < #{new_end_time} and end_time < #{new_start_time}" }
  #   }

  # scope :start_end_time_booked, lambda {|new_start_time, new_end_time| 
  #   {:conditions => "start_time < #{new_start_time} and end_time < #{new_start_time}" }
  #   }

  scope :end_during, ->(new_start_time, new_end_time) do
    where(end_time: new_start_time..new_end_time)
  end

  scope :start_during, ->(new_start_time, new_end_time) do
    where(start_time: new_start_time..new_end_time)
  end

  scope :happening_during, ->(new_start_time, new_end_time) do
    where('start_time > ? AND end_time < ?', new_start_time, new_end_time)
  end

  def overlaps
    [ Booking.all.end_during(start_time, end_time),
      Booking.all.start_during(start_time, end_time),
      Booking.all.happening_during(start_time, end_time)
    ].flatten
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

end