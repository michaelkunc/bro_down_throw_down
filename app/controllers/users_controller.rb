class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to current_user
    else
      @errors = @user.errors
      render 'users/new'
    end
  end

  def show
    current_user
    render 'users/show'
  end

  def update
    current_user
  end

  def search
    @results = User.text_search(params[:query])
    render 'users/search'
  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :image_url, :bio, :password)
  end


end