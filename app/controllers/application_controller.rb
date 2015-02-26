class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    end
  end

  helper_method :current_user

  protected

  def require_current_user
    if current_user.blank?
      redirect_to users_path, notice: "You must log in"
    end
  end

end
