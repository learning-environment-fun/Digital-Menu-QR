class AddGratuityPercentageToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :gratuity_percentage, :integer, :default => 10
  end
end
