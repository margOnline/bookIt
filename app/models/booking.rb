class Booking < ActiveRecord::Base
  
  belongs_to :resource

  validates :start_time, presence: true 
  validate :start_date_cannot_be_in_the_past
  validates :length, presence: true

  def start_date_cannot_be_in_the_past
    if start_time && start_time < DateTime.now
      errors.add(:start_time, 'can\'t be in the past')
    end
  end

  def calculate_end_time
    start_time = self.start_time
    length = self.length.to_i
    start_time + length.hours
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