class Admin::UserListsController < ApplicationController
  before_action :set_admin_user_list, only: [:show]

  def index
    @user_lists = User.all
  end

  def show
  end

  private
    def set_admin_user_list
      @user_list = User.find(params[:id])
    end

    def user_list_params
      params.require(:user).permit(:email, :role_id, :name)
    end


end
