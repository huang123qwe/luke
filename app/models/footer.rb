class Footer < ActiveRecord::Base

  validates_uniqueness_of :name
  validates_presence_of :name, :title, :content

  class << self

    def names
      %w{ 关于我们 联系我们 帮助中心 意见中心 会员管理 合作伙伴 }
    end

  end

end
