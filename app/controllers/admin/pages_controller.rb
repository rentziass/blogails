class Admin::PagesController < Admin::AdminController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]
  def index
    @pages = Page.all
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
    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_page_path(@page), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    if @page
      @page.destroy
      respond_to do |format|
        format.html { redirect_to  admin_pages_url, notice: 'Page was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_admin_page
      @page = Page.friendly.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :text, :visible, :user_id, :current_user, :position, :slug, :use_slug)
    end

end
