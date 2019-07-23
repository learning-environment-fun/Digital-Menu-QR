class RenameTypeToFoodType < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :type, :food_type
  end
end
