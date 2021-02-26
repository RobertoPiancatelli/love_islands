class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :name
      t.string :location
      t.integer :price_cents
      t.string :description
      t.integer :max_guests
      t.references :user, null: false, foreign_key: true
      t.references :bookings, null: false, foreign_key: true

      t.timestamps
    end
  end
end
