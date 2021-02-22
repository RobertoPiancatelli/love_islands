class UpdatingUserModel < ActiveRecord::Migration[6.0]
 def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_host?, :boolean
  end
end

