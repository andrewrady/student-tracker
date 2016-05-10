class UsersController < ApplicationController
  before_action :deny
  layout 'student'

  def deny
		redirect_to root_path unless current_user.admin?
	end

  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/admin'
    else
      render root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
