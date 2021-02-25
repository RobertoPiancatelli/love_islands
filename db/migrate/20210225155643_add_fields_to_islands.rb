class AddFieldsToIslands < ActiveRecord::Migration[6.0]
  def change
    add_column :islands, :gym, :boolean, default: false
    add_column :islands, :pool, :boolean, default: false
    add_column :islands, :boat, :boolean, default: false
    add_column :islands, :helicopter, :boolean, default: false
    add_column :islands, :bedrooms, :integer
  end
end
