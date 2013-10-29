class Booking < ActiveRecord::Base
  has_and_belongs_to_many :resources
  
  validates :start_time, presence: true
  validates :end_time, presence: true
end
