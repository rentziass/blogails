class Admin::OptionsController < ApplicationController

  def index
    @options = Option.all
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    respond_to do |format|
      if @option.save
        format.html { redirect_to admin_options_path(@option), notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_admin_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:title, :subtitle, :footer, :analitics)
    end

end
