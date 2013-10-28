class Resource < ActiveRecord::Base

  validates :name, presence: {message: 'You must enter a name'}
end
