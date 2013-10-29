class AddResourceIdtoBookings < ActiveRecord::Migration

  def change
    add_reference :bookings, :resource, index: true

  end
end
