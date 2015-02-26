class ListsController < ApplicationController
  before_filter :require_current_user

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    List.create!(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name).merge(user_id: session[:user_id])
  end
end
