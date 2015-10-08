class Admin::EnclosuresController < Admin::AdminController
  before_action :set_admin_enclosure, only: [:show, :edit, :update, :destroy]

  def index
    @enclosures = Enclosure.all
  end

  def show
  end

  def new
    @enclosure = Enclosure.new
  end

  def edit
  end

  def create
    @enclosure = current_user.enclosures.build(enclosure_params)

    respond_to do |format|
      if @enclosure.save
        format.html { redirect_to admin_enclosure_path(@enclosure), notice: 'Enclosure was successfully created.' }
        format.json { render :show, status: :created, location: @enclosure }
      else
        format.html { render :new }
        format.json { render json: @enclosure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @enclosure.update(enclosure_params)
        format.html { redirect_to admin_enclosure_path(@enclosure), notice: 'Enclosure was successfully updated.' }
        format.json { render :show, status: :ok, location: @enclosure }
      else
        format.html { render :edit }
        format.json { render json: @enclosure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @enclosure
      @enclosure.destroy
      respond_to do |format|
        format.html { redirect_to admin_enclosures_url, notice: 'Enclosure was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_admin_enclosure
      @enclosure = Enclosure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enclosure_params
      params.require(:enclosure).permit(:title, :description, :user_id, :current_user, :file)
    end
end
