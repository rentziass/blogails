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

    if @enclosure.save
      redirect_to admin_enclosure_path(@enclosure)
    else
      render :new
    end
  end

  def update
    if @enclosure.update(enclosure_params)
      redirect_to admin_enclosure_path(@enclosure)
    else
      render :edit
    end
  end

  def destroy
    if @enclosure
      @enclosure.destroy
      redirect_to admin_enclosures_url
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
