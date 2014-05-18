class Lamp < ActiveRecord::Base

  validates_presence_of :name, :position

  def self.positions
    ["左", "右"]
  end

  include ImgCrop
  # attached start
  has_attached_file :cover, :styles => { :small => "140x170#", :large => "500x500>" }, :processors => [:cropper]
  validates_attachment_content_type :cover, :content_type => /\Aimage/
  validates_attachment :cover, :size => { :in => 0..2.megabytes }

end
