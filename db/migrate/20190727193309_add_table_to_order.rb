class AddTableToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :table, foreign_key: true
  end
end
