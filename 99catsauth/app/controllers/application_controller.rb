class ApplicationController < ActionController::Base

  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!
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

  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def redirect_to_cats
    if current_user
      redirect_to cats_url
    end
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
