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

  include ImgCrop
  # attached start
  has_attached_file :cover, :styles => { :video => "410x470#", :small => "421x480#", :large => "500x500>" }, :processors => [:cropper]
  validates_attachment_content_type :cover, :content_type => /\Aimage/
  validates_attachment :cover, :size => { :in => 0..4.kilobytes }
  
end
