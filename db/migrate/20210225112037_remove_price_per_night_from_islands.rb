class RemovePricePerNightFromIslands < ActiveRecord::Migration[6.0]
  def change
    remove_column :islands, :price_per_night
  end
end
