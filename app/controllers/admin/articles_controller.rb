class Admin::ArticlesController < AdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  set_tab :article

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.ordered_articles.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    product_ids = params[:article].delete(:product_ids)
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save

        if !product_ids.nil?
          Product.where(id: product_ids).each do |t|
            ProductsArticle.create(product_id: t.id, article_id: @article.id)
          end
        end
        
        if params[:article][:top_cover].present?
          format.html {
            render :action => "top_cover_crop"
          }
        elsif params[:article][:cover].present?
          format.html {
            render :action => "crop"
          }
        else
          format.html { redirect_to [:admin, @article], notice: 'Article was successfully created.' }
          format.json { render action: 'show', status: :created, location: @article }
        end

      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    product_ids = params[:article].delete(:product_ids)
    respond_to do |format|
      if @article.update(article_params)
        # set null for pre-group
        if !product_ids.nil?
          ProductsArticle.where.not(product_id: product_ids).where(article_id: @article.id).destroy_all

          Product.where(id: product_ids).each do |t|
            ProductsArticle.where(product_id: t.id, article_id: @article.id).first_or_create
          end
        end

        if @article.cropping?
          @article.cover.reprocess!
        end

        if params[:article][:top_cover].present?
          format.html {
            render :action => "top_cover_crop"
          }          
        elsif params[:article][:cover].present?
          format.html {
            render :action => "crop"
          }          
        else
          format.html { redirect_to [:admin, @article], notice: 'Article was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :cover, :content, :top, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
