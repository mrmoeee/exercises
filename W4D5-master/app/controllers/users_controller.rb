class UsersController < ApplicationController
  
  def index 
    @users = User.all 
    render :index
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    # @users = User.all
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      # debugger
      redirect_to users_url
      # debugger
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show 
    @user = User.find(params[:id])
    render :show
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end