class ArticlesController < ApplicationController

  def index
    @first_artilce = Article.last
    @artilces = Article.where.not(id: @first_artilce.id).all if @first_artilce
  end

end