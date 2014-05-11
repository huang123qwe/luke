class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  def index
    @first_article = Article.ordered_articles.first
    @articles = Article.ordered_articles.all[1..-1]
  end

  def show
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

end