class Restaurant < ApplicationRecord
  has_many :tables

  # Presence
  validates :name, presence: true
  validates :address, presence: true
  validates :restaurant_image, presence: true

  # Unique
  validates :name, uniqueness: true
  validates :address, uniqueness: true

  #Pics or it didnt happen
  mount_uploader :restaurant_image, PhotoUploader
end
