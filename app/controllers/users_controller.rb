class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.username.downcase!

    if @user.save
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now.alert = "Couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
