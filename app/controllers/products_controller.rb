class ProductsController < ApplicationController

  def index
    @first_product = Product.last
    @products = Product.where.not(id: @first_product.id).all if @first_product
  end

end