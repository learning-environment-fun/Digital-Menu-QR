class AddTableNumberToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :table_number, :string
  end
end
