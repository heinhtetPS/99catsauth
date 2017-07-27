class UsersController < ApplicationController
  before_action :redirect_to_cats

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if user.save
      render :cats_url
    else
      render flash.now[:errors] = @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :session_token)
  end
end
