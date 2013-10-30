class RemoveEndTimeFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :end_time, :datetime
  end
end
