class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: :destroy
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    
    if @user.nil?
      render json: "Credentials were wrong"
    else 
      login(@user)
      redirect_to cats_url 
    end
  end  
  
  def destroy 
    logout
  end
  


end
