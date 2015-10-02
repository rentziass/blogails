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
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to admin_options_path(@option), notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
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
