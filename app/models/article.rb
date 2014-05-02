class Article < ActiveRecord::Base
  mount_uploader :cover, ImageUploader

  has_many :products_articles,:dependent => :destroy
  has_many :products, :through => :products_articles

end
