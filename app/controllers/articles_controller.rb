class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  def index
    @first_article = Article.ordered_articles.first
    @articles = Article.ordered_articles.all[1..-1]
  end

  def show
  end

  def list
    @articles = Article
    @articles = @articles.where(category: params[:category]) if params[:category]
    @articles = @articles.where("tags like ? or tags like ? or tags = ?","%,#{params[:tag]},%","%,#{params[:tag]}",params[:tag])
    @articles = @articles.all
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

end