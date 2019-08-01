class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  validates :table_number, presence: true


  def self.averages
    averages = {}
    self.all.each do |table|
      averages[table.id] = table.orders.map(&:avg_time).sum / table.orders.count
    end
    return averages
  end
end
