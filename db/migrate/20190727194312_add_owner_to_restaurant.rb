class AddOwnerToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :owner, foreign_key: { to_table: :users }
  end
end
