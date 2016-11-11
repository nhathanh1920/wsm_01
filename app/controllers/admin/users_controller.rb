class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.newest.page(params[:page]).
      per Settings.users_paginates
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.susscess.created_user"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "flash.success.deleted_user"
    else
      flash[:danger] = t "flash.fail.deleted_user"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation).merge role: User.roles[:manager]
  end
end
