class AddingBooleanValueToUserModel < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_host?, :boolean, default: false
  end
end
