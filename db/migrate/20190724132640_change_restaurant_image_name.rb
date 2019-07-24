class ChangeRestaurantImageName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurants, :restaurant_image, :image
  end
end
