class Admin::PagesController < Admin::AdminController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all

    if params[:query].present?
      @pages = Page.search(params[:query], page: params[:page])
    else
      @pages = Page.all.page params[:page]
    end
  end

  def show
  end

  def edit
  end

  def new
    @page = Page.new
  end

  def create
    @page = current_user.pages.build(page_params)

    if @page.save
      redirect_to admin_pages_path
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  def destroy
    if @page
      @page.destroy
      redirect_to  admin_pages_url
    end
  end

  def autocomplete
    render json: Page.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private

  def set_admin_page
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :text, :visible, :user_id, :current_user, :position, :slug, :use_slug, :image, :remove_image)
  end

end