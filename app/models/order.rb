class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurant
  belongs_to :table
  has_many :order_items, :dependent => :destroy
  has_many :items, :through => :order_items
  after_save :total_cost

  after_create :set_start_time

#   validates :kitchen_status, presence: true

#   validates :transaction_price, presence: true
#   validates :transaction_price, numericality: { only_integer: true }

#   validates :transaction_status, presence: true

#   validates :transaction_type, presence: true

  def total_cost
    new_amount = self.order_items.length < 1 ? 0 : self.order_items.to_a.map { |order_item| order_item.item_price * order_item.quantity }.reduce(:+)
    self.amount = new_amount
  end




  # def gratuity_amount
  #   return total_cost * self.gratuity_percentage / 100.to_f
  # end

  # def total_cost_with_gratuity
  #   return total_cost.to_f + self.gratuity_amount.to_f
  # end

  def gratuity_amount_formatted
    format_amount(gratuity_amount)
  end

  def avg_time
    return ((end_time - start_time)/ 60).to_i

  end

  def self.numbers
    return self.joins(:table).group(:table_number).count
  end


  private

  def set_start_time
    start_time = Time.now
  end
end
