class HomeController < ApplicationController
  def show
    unless session[:user_id].present?
      redirect_to users_path
    end
  end
end
