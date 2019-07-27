class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurant
  has_one :table
  has_many :order_items, :dependent => :destroy
  has_many :items, :through => :order_items

#   validates :kitchen_status, presence: true

#   validates :transaction_price, presence: true
#   validates :transaction_price, numericality: { only_integer: true }

#   validates :transaction_status, presence: true

#   validates :transaction_type, presence: true

  def total_cost 
    return self.order_items.to_a.map { |order_item| order_item.item_price * order_item.quantity }.reduce(:+)
  end

  def gratuity_amount
    return total_cost * self.gratuity_percentage / 100.to_f
  end

  def total_cost_with_gratuity
    return total_cost.to_f + gratuity_amount.to_f
  end

  def format_amount(amount) 
    return (amount.to_f / 100.to_f).round(2)
  end

  def total_cost_formatted
    format_amount(total_cost)
  end

  def total_cost_with_gratuity_formatted
    format_amount(total_cost_with_gratuity)
  end

  def gratuity_amount_formatted
    format_amount(gratuity_amount)
  end
end
