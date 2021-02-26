class RemovePricePerNightFromIslands < ActiveRecord::Migration[6.0]
  def change
    remove_column :islands, :price_cents
  end
end
