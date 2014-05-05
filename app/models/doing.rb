class Doing < ActiveRecord::Base

  mount_uploader :video, FileUploader

  validates_presence_of :position

  scope :left_banners, -> { where(position: '左') }
  scope :right_banners, -> { where(position: '右') }
  scope :video_banners, -> { where(position: '视频') }
  scope :flash_banners, -> { where(position: 'flash') }
  scope :advertise_banners, -> { where(position: '广告') }

  def self.positions
    ["左", "右", "视频", "广告", "flash"]
  end

  def self.video_types
    ["video/mp4", "video/webm", "video/ogg"]
  end

  # attached start
  has_attached_file :cover, :styles => { :video => "400x460#", :small => "421x480#", :large => "500x500>" }, :processors => [:cropper]
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_cover, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def cover_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(cover.path(style))
  end
  # attached end

  private
  
  def reprocess_cover
    cover.reprocess!
  end

end
