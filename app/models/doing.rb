class Doing < ActiveRecord::Base
  mount_uploader :cover, ImageUploader
  mount_uploader :video, FileUploader

  validates_presence_of :position

  scope :left_banners, -> { where(position: '左') }
  scope :right_banners, -> { where(position: '右') }
  scope :video_banners, -> { where(position: '中') }
  scope :advertise_banners, -> { where(position: '广告') }

  def self.positions
    ["左", "右", "视频","广告"]
  end

  def self.video_types
    ["video/mp4", "video/webm", "video/ogg"]
  end

end
