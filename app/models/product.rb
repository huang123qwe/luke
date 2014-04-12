class Product < ActiveRecord::Base
  mount_uploader :cover, ImageUploader
end