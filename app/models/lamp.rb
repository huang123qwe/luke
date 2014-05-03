class Lamp < ActiveRecord::Base

  validates_presence_of :name, :position

  has_attached_file :cover, :styles => { :small => "140x170#", :large => "500x500>" }, :processors => [:cropper]
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_cover, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def cover_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(cover.path(style))
  end

  def self.positions
    ["左", "右"]
  end
  
  private
  
  def reprocess_cover
    cover.reprocess!
  end
end
