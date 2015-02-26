class UsersController < ApplicationController
  def index
    @users = User.all.order('lower(users.name)')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :email))
    redirect_to users_path
  end

  def login
    session[:user_id] = User.find(params[:user_id]).id

    redirect_to root_path
  end

end
