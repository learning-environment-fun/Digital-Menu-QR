class AddTransactionTimeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :start_time, :time
    add_column :orders, :end_time, :time
  end
end
