class Restaurant < ApplicationRecord
  has_many :tables, :dependent => :destroy
  has_many :items, :dependent => :destroy
  has_many :order_items
  has_many :orders, :through => :order_items
  belongs_to :owner, class_name: "User"

  # Presence
  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true

  # Unique
  validates :name, uniqueness: true
  validates :address, uniqueness: true

  #Pics or it didnt happen
  mount_uploader :image, PhotoUploader
end
