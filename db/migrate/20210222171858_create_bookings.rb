class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :guests
      t.integer :total_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
