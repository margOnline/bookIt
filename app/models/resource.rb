class Resource < ActiveRecord::Base
  has_and_belongs_to_many :bookings

  validates :name, 
    presence: true, 
    uniqueness: true
end
