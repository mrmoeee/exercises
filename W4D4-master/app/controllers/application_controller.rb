class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :redirect_if_logged_in
  #setting the session
  def current_user
    #return nil if no session session_token
    #otherwise return current user if exist else find by session session_token
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user!(user)
    debugger
    @current_user = user
    session[:session_token] = user.session_token
  end

  def redirect_if_logged_in
    redirect_to users_url if current_user
  end

  def logout
    current_user.reset_session_token!

    session[:session_token] = nil
  end

end
