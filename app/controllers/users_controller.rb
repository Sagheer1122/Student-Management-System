class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: %i[index make_admin]
  def index
    if current_user && current_user.admin?
      @users = User.all
    else
      @users = User.where(admin: false)
    end
  end
  def show
    @user = User.find(params[:id])
  end

  def make_admin
    @user = User.find(params[:id])
    if @user.update(admin: true)
      flash[:notice] = "User promoted to admin successfully."
    else
      flash[:alert] = "Failed to promote user to admin."
    end
    redirect_to users_path
  end

  private
 def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "Access denied."
    end
 end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
