class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, :dependent => :destroy
  has_many :orders, through: :order_items




  # Presence of Attributes
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :food_type, presence: true
  validates :image, presence: true

  # Price only an Integer
  validates :price, numericality: { only_integer: true }

  # Picture Upload Gem related
  mount_uploader :image, PhotoUploader

  def price_formatted
    return (self.price / 100.to_f).round(2)
  end

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
