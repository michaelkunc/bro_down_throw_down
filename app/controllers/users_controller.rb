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
    @user = requested_user
    @challengers = Relationship.find_by(challenged: @user)
    render 'users/show'
  end

  def update
    current_user
  end

  def search
    @users = User.text_search(params[:query])
    render 'users/index'
  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :image_url, :bio, :password)
  end

  def requested_user
    User.find_by(id: params[:id])
  end


end