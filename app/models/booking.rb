class Booking < ActiveRecord::Base
  
  belongs_to :resources

  validates :start_time, presence: true
  validates :end_time, presence: true

  attr_accessor :length


end
