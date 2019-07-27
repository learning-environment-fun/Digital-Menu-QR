class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  validates :table_number, presence: true
end
