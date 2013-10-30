class AddLengthToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :length, :integer
  end
end
