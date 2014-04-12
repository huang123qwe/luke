class ProductsController < ApplicationController

  before_action :set_article, only: [:show]

  def index
    @first_product = Product.last
    @products = Product.where.not(id: @first_product.id).all if @first_product
  end


  def show
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

end