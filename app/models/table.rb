class Table < ApplicationRecord
  belongs_to :restaurant

  validates :table_number, presence: true
end
