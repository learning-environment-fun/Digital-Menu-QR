class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items

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
end
