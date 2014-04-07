class Doing < ActiveRecord::Base
  mount_uploader :cover, ImageUploader

  validates_presence_of :position

  scope :left_banner, -> { where(position: '左') }
  scope :right_banner, -> { where(position: '右') }

  def self.positions
    ["左下","右下","左","右"]
  end
end
