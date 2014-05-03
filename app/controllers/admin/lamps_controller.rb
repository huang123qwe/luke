class Admin::LampsController < AdminController
  before_action :set_lamp, only: [:show, :edit, :update, :destroy]

  set_tab :lamp

  # GET /lamps
  # GET /lamps.json
  def index
    @lamps = Lamp.all
  end

  # GET /lamps/1
  # GET /lamps/1.json
  def show
  end

  # GET /lamps/new
  def new
    @lamp = Lamp.new
  end

  # GET /lamps/1/edit
  def edit
  end

  # POST /lamps
  # POST /lamps.json
  def create
    @lamp = Lamp.new(lamp_params)

    respond_to do |format|
      if @lamp.save
        if params[:lamp][:cover].blank?
          format.html { redirect_to [:admin, @lamp], notice: 'Lamp was successfully created.' }
          format.json { render action: 'show', status: :created, location: @lamp }
        else
          format.html { 
            render :action => "crop"
          }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lamps/1
  # PATCH/PUT /lamps/1.json
  def update
    respond_to do |format|
      if @lamp.update(lamp_params)
        if params[:lamp][:cover].blank?
          format.html { redirect_to [:admin, @lamp], notice: 'Lamp was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { 
            render :action => "crop"
          }
        end

      else
        format.html { render action: 'edit' }
        format.json { render json: @lamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lamps/1
  # DELETE /lamps/1.json
  def destroy
    @lamp.destroy
    respond_to do |format|
      format.html { redirect_to admin_lamps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lamp
      @lamp = Lamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lamp_params
      params.require(:lamp).permit(:name, :cover, :position)
    end
end
