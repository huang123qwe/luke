class Product < ActiveRecord::Base

  has_many :order, dependent: :destroy

  has_many :products_articles,:dependent => :destroy
  has_many :articles, :through => :products_articles

  include ImgCrop
  # attached start
  has_attached_file :cover, :styles => { :small => "330x175#", :large => "500x500>" }, :processors => [:cropper]
  validates_attachment_content_type :cover, :content_type => /\Aimage/

  has_attached_file :top_cover, :styles => { :small => "630x260#", :large => "800x800>" }, :processors => [:cropper]
  validates_attachment_content_type :top_cover, :content_type => /\Aimage/

  def top_cover_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(top_cover.path(style))
  end

end