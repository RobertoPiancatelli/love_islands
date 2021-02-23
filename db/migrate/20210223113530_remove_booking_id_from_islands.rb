class RemoveBookingIdFromIslands < ActiveRecord::Migration[6.0]
  def change
    remove_column :islands, :bookings_id, :references
  end
end
