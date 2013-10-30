class Booking < ActiveRecord::Base
  
  belongs_to :resource

  validates :start_time, presence: true
  validates :length, presence: true

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
    :allday => false
    # :url => Rails.application.routes.url_helpers.resource_bookings_path(id)
   }  
  end  

end
