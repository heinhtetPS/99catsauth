class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
      )

    if user
      login(user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid Username or Password"]
      render :new
    end

  end

  def new
    render :new
  end

  def destroy
    #later
  end
end
