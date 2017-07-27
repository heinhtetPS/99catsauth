class SessionsController < ApplicationController
  before_action :redirect_to_cats, only: [:create,  :new]

  def create
    login_user
  end

  def new
    render :new
  end

  def destroy
    #later
  end
end
