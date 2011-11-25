class SessionsController < ApplicationController
  
  layout 'login_signup'
  
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
    
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to(user)
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :alert => "Logged out"
  end

end
