class Category < ActiveRecord::Base
  validates_uniqueness_of :name

  before_update :filter_comma

  def filter_comma
    self.tags = self.tags.to_s.gsub(/，/,',')
  end

end
