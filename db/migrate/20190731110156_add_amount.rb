class AddAmount < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :amount, :money
    add_column :orders, :payment, :jsonb
  end
end
