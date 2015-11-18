class Admin::CategoriesController < Admin::AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(:title)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category
      @category.destroy
      redirect_to admin_categories_url
    end
  end

  private

  def set_admin_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:title, :description, :image, :remove_image)
  end
  
end
