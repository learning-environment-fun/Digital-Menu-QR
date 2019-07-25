class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :table
  has_many :order_items

#   validates :kitchen_status, presence: true

#   validates :transaction_price, presence: true
#   validates :transaction_price, numericality: { only_integer: true }

#   validates :transaction_status, presence: true

#   validates :transaction_type, presence: true
end
