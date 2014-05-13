module ImgCrop

  def self.included(base)
    base.class_eval do
      attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
      after_update :reprocess_cover, :if => :cropping?
    end
  end

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