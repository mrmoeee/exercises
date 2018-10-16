class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :redirect_if_logged_in, :logout
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
    # fail
  end
  
  def login(user) 
    @current_user = user
    session[:session_token] = @current_user.reset_session_token!
  end
  
  def redirect_if_logged_in
    redirect_to cats_url if current_user
  end
  
  def logout
    if current_user
      current_user.reset_session_token!
    end 
    session[:session_token] = nil
    redirect_to cats_url
  end 
  
end
