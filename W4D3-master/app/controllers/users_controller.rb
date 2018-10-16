class UsersController < ApplicationController
  before_action :redirect_if_logged_in, except: :destroy

  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user
      @user.save!
      login(@user)
      redirect_to cats_url
    else
      render json: @user.errors.full_messages
    end 
  end 
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password_digest, :session_token, :password)
  end 
  
end
