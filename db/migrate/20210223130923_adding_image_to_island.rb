class AddingImageToIsland < ActiveRecord::Migration[6.0]
  def change
    add_column :islands, :image_url, :string
  end
end
