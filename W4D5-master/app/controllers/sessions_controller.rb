class SessionsController < ApplicationController
  
  def new 
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    unless @user.nil?
      login_user!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ['Credentials are wrong']
      render :new
    end
  end
  
  def destroy
    logout!
    redirect_to users_url
  end
  
end
