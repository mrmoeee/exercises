class SessionsController < ApplicationController

  def new
    render :new
  end


  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Wrong Username or Password"]
      render :new
    else
      login_user!(user)
      #fix redirection to appropriate place
      redirect_to user_url(user)
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
