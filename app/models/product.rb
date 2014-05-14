class Product < ActiveRecord::Base

  has_many :order, dependent: :destroy

  has_many :products_articles,:dependent => :destroy
  has_many :articles, :through => :products_articles

  include ImgCrop
  # attached start
  has_attached_file :cover, :styles => { :small => "330x175#", :large => "500x500>" }, :processors => [:cropper]

end