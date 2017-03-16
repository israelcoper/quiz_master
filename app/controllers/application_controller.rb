class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
    redirect_to new_admin_session_path, alert: "You must be logged as admin" if current_user.nil? && current_user.admin?
  end

  def authenticate_user
    redirect_to new_session_path, alert: "You must be logged" if current_user.nil?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
