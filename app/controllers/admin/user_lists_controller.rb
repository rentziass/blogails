class Admin::UserListsController < ApplicationController
  before_action :set_admin_user_list, only: [:show, :edit, :update, :destroy]

  def index
    @user_lists = User.all.order(:role_id)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user_list.update(user_list_params)
        format.html { redirect_to admin_user_list_path(@user_list), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_list }
      else
        format.html { render :edit }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user_list
      @user_list.destroy
      respond_to do |format|
        format.html { redirect_to  admin_user_lists_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end


  private
    def set_admin_user_list
      @user_list = User.find(params[:id])
    end

    def user_list_params
      params.require(:user).permit(:email, :password, :role_id, :name, :first_name, :last_name)
    end


end
