class Admin::LinksController < Admin::AdminController
  before_action :set_admin_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to admin_links_path
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to admin_links_path
    else
      render :edit
    end
  end

  def destroy
    if @link
      @link.destroy
      redirect_to admin_links_url
    end
  end

  private

  def set_admin_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :description, :link, :user_id, :current_user)
  end

end
