class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
    else
      @errors = @user.errors
      render 'users/new'
    end
  end

  def update
    current_user
  end




  private

  def user_params
    params.require(:user).permit(:username, :email, :image_url, :bio, :password)
  end

  def current_user
    @user = User.find_by(params[:id])
  end

end