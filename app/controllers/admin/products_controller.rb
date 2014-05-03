class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  set_tab :product

  # GET /admin/products
  # GET /admin/products.json
  def index
    @products = Product.all
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    article_ids = params[:product].delete(:article_ids)
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        Article.where(id: article_ids).each do |t|
          ProductsArticle.create(article_id: t.id, product_id: @product.id)
        end
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    article_ids = params[:product].delete(:article_ids)
    respond_to do |format|
      if @product.update(product_params)

        # set null for pre-group
        ProductsArticle.where.not(article_id: article_ids).where(product_id: @product.id).destroy_all

        Article.where(id: article_ids).each do |t|
          ProductsArticle.where(article_id: t.id, product_id: @product.id).first_or_create
        end

        format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :content, :cover, :country, :city)
    end
end
