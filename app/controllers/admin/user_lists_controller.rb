class Admin::UserListsController < Admin::AdminController
  before_action :set_admin_user_list, only: [:show, :edit, :update, :destroy]

  def index
    @user_lists = User.all.order(:role_id)
  end

  def show
  end

  def edit
  end

  def update
    if @user_list.update(user_list_params)
      redirect_to admin_user_list_path(@user_list)
    else
      render :edit
    end
  end

  def destroy
    if @user_list
      @user_list.destroy
      redirect_to admin_user_lists_url
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
