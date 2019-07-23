class Item < ApplicationRecord
  belongs_to :restaurant


  mount_uploader :image, PhotoUploader

end
