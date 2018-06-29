class LoginController < ApplicationController
  protect_from_forgery with: :exception
  before_action :without_user, except: :logout

  def index
  end

  def logout
    reset_session
    redirect_to "/"
  end

  def verify
    username = params[:username]
    user = User.find_or_initialize_by(username: username)
    if user.valid?
      user.save
      session[:user] = user
      redirect_to '/trades/index'
    else
      flash[:msg] = "Please Fill Username."
      redirect_to '/'
    end
  end
end
