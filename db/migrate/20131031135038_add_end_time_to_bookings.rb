class AddEndTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :end_time, :datetime
  end
end
