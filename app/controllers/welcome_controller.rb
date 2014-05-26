class WelcomeController < ApplicationController
  def index
    categories = Category.all.to_a || []
    @where_tags = categories.detect{|i| i.name == "去哪里" }.tags.split(',')
    @doing_tags = categories.detect{|i| i.name == "去干吗" }.tags.split(',')
    @hotes_tags = categories.detect{|i| i.name == "酒店" }.tags.split(',')
    @news_tags = categories.detect{|i| i.name == "咨询" }.tags.split(',')
    @viedos_tags = categories.detect{|i| i.name == "视频" }.tags.split(',')
  end

  def about
  end
end