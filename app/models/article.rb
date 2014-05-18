class Article < ActiveRecord::Base

  scope :ordered_articles, -> { order("top_at DESC nulls last, top DESC nulls last").limit(7) }

  has_many :products_articles,:dependent => :destroy
  has_many :products, :through => :products_articles

  before_save :set_top_at

  include ImgCrop
  # attached start
  has_attached_file :cover, :styles => { :small => "330x175#", :large => "800x800>" }, :processors => [:cropper]
  validates_attachment_content_type :cover, :content_type => /\Aimage/
  validates_attachment :cover, :size => { :in => 0..500.kilobytes }
  
  has_attached_file :top_cover, :styles => { :small => "630x260#", :large => "800x800>" }, :processors => [:cropper]
  validates_attachment_content_type :top_cover, :content_type => /\Aimage/
  validates_attachment :top_cover, :size => { :in => 0..800.kilobytes }

  def top_cover_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(top_cover.path(style))
  end

  private

    def set_top_at
      self.top_at = Time.now if self.top && self.top_changed?
    end

end
