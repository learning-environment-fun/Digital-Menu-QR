class RemoveTableFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :table_id
    add_reference :orders, :restaurant, foreign_key: true
  end
end
