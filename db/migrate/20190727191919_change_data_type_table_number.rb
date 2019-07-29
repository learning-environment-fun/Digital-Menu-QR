class ChangeDataTypeTableNumber < ActiveRecord::Migration[5.2]
  def change
    remove_column :tables, :table_number
    add_column :tables, :table_number, :integer
  end
end
