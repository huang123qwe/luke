class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  def index
    @first_article = Article.last
    @articles = Article.where.not(id: @first_article.id).all if @first_article
  end

  def show
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

end