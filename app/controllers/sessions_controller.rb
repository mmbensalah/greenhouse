class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
   session.delete(:user_id)
   redirect_to login_path, notice: "Logged out!"
  end
end
