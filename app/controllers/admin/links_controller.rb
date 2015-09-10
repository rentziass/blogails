class Admin::LinksController < ApplicationController
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
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to admin_link_path(@link), notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to admin_link_path(@link), notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @link
      @link.destroy
      respond_to do |format|
        format.html { redirect_to  admin_links_url, notice: 'Link was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

    def set_admin_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :description)
    end

end
