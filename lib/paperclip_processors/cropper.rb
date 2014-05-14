module Paperclip
  class Cropper < Thumbnail

    def transformation_command
      if crop_command
        scale, crop = @current_geometry.transformation_to(@target_geometry, crop?)
        trans = []
        trans << "-coalesce" if animated?
        trans << "-auto-orient" if auto_orient
        trans << "-resize" << %["#{scale}"] unless scale.nil? || scale.empty?
        trans << "-crop" << %["#{crop_command[1]}"] << "+repage"
        trans << '-layers "optimize"' if animated?
        trans
        crop_command + super.join(' ').sub(/ -crop \S+/, '').split(' ') # super returns an array like this: ["-resize", "100x", "-crop", "100x100+0+0", "+repage"]
      else
        super
      end
    end

    def crop_command
      target = @attachment.instance
      if target.cropping?
        ["-crop", "#{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}"]
      end
    end
  end
end
