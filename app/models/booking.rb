class Booking < ActiveRecord::Base
  
  belongs_to :resource

  validates :start_time, presence: true
  validates :length, presence: true

  def calculate_end_time
    start_time = self.start_time
    length = self.length.to_i
    start_time + length.hours
  end

end
