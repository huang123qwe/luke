class Product < ActiveRecord::Base
  mount_uploader :cover, ImageUploader
  has_many :order, dependent: :destroy

  has_many :products_articles,:dependent => :destroy
  has_many :articles, :through => :products_articles

end