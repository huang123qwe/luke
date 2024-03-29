class Admin::DoingsController < AdminController
  before_action :set_doing, only: [:show, :edit, :update, :destroy]

  set_tab :doing

  # GET /doings
  # GET /doings.json
  def index
    @doings = Doing.all
  end

  # GET /doings/1
  # GET /doings/1.json
  def show
  end

  # GET /doings/new
  def new
    @doing = Doing.new
  end

  # GET /doings/1/edit
  def edit
  end

  # POST /doings
  # POST /doings.json
  def create
    @doing = Doing.new(doing_params)

    respond_to do |format|
      if @doing.save
        if params[:doing][:cover].blank? || @doing.position == "广告"
          format.html { redirect_to [:admin,@doing], notice: 'Doing was successfully created.' }
          format.json { render action: 'show', status: :created, location: @doing }
        else
          format.html { 
            if @doing.position == "视频"
              render :action => "video_crop"
            else
              render :action => "crop"
            end
          }
        end

      else
        format.html { render action: 'new' }
        format.json { render json: @doing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doings/1
  # PATCH/PUT /doings/1.json
  def update
    respond_to do |format|
      if @doing.update(doing_params)

        if @doing.cropping?
          @doing.cover.reprocess!
        end

        if params[:doing][:cover].blank? || @doing.position == "广告"
          format.html { redirect_to [:admin,@doing], notice: 'Doing was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { 
            if @doing.position == "视频"
              render :action => "video_crop"
            else
              render :action => "crop"
            end
          } 
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @doing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doings/1
  # DELETE /doings/1.json
  def destroy
    @doing.destroy
    respond_to do |format|
      format.html { redirect_to admin_doings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doing
      @doing = Doing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doing_params
      params.require(:doing).permit(:name, :cover, :position, :video, :video_type, :src, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
