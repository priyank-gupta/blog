class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  
  private
  
  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def logged_in?
    session[:user_id]
  end
end
