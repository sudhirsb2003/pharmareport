class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= TabUser.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user 

  def login_required
  	redirect_to login_path , alert: "Not logged In"  if current_user.nil?
  end

  
end
