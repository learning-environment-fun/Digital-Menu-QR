class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :quantity, presence: true
  validates :item_price, presence: true

  validates :quantity, numericality: { only_integer: true }
  validates :item_price, numericality: { only_integer: true }

  def total_cost
    return self.quantity * self.item_price
  end

  def total_cost_formatted
    return (total_cost / 100.to_f).round(2)
  end
end
