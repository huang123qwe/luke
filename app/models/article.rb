class Article < ActiveRecord::Base
  mount_uploader :cover, ImageUploader

  scope :ordered_articles, -> { order("top_at DESC nulls last, top DESC nulls last").limit(7) }

  has_many :products_articles,:dependent => :destroy
  has_many :products, :through => :products_articles

  before_save :set_top_at

  private

    def set_top_at
      self.top_at = Time.now if self.top && self.top_changed?
    end

end
