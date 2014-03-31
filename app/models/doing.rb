class Doing < ActiveRecord::Base
  mount_uploader :cover, ImageUploader

  validates_presence_of :position

  def self.positions
    ["左下","右下"]
  end
end
