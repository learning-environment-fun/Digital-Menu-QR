class Restaurant < ApplicationRecord
  has_many :tables

  # Presence
  validates :name, presence: true
  validates :address, presence: true

  # Unique
  validates :name, uniqueness: true
  validates :address, uniqueness: true
end
