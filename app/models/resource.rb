class Resource < ActiveRecord::Base

  validates :name, 
    presence: true, 
    uniqueness: true
end
