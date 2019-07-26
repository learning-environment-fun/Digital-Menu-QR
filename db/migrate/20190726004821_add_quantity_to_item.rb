class AddQuantityToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :quantity, :integer, :default => 1
  end
end
