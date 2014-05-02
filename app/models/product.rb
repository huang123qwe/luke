class Product < ActiveRecord::Base
  mount_uploader :cover, ImageUploader
  has_many :order, dependent: :destroy
end