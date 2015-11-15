class Admin::OptionsController < Admin::AdminController
  before_action :set_admin_option, only: [:show, :edit, :update]

  def index
    @options = Option.all
  end

  def show
  end

  def edit
  end

  def update
    if @option.update(option_params)
      redirect_to admin_options_path(@option)
    else
      render :edit
    end
  end

  private

  def set_admin_option
    @option = Option.find(params[:id])
  end

  def option_params
    params.require(:option).permit(:title, :subtitle, :footer, :analitics, :copyright, :number_per_page)
  end
    
end
