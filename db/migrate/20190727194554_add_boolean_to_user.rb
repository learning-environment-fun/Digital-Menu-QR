class AddBooleanToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_restaurant_owner, :boolean, default: false
  end
end
