class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :kitchen_status
      t.integer :transaction_price
      t.string :transaction_status
      t.string :transaction_type
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
