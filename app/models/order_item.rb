class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :quantity, presence: true
  validates :item_price, presence: true

  validates :quantity, numericality: { only_integer: true }
  validates :item_price, numericality: { only_integer: true }
end
