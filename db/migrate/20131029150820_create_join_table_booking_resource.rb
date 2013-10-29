class CreateJoinTableBookingResource < ActiveRecord::Migration
  def change
    create_join_table :bookings, :resources do |t|
      # t.index [:booking_id, :resource_id]
      # t.index [:resource_id, :booking_id]
    end
  end
end
