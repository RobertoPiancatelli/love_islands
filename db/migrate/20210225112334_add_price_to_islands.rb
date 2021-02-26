class AddPriceToIslands < ActiveRecord::Migration[6.0]
  def change
    add_monetize :islands, :price, currency: { present: false }
  end
end
