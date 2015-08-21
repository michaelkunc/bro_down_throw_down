class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :destroy, :challenged, :challengers]

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
    @challengers = challengers(@user)
    @challenged = challenged(@user)
    render 'users/show'
  end

  def edit
    @user = requested_user
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

  def challengers(user)
    Relationship.where(challenged: user)
  end

  def challenged(user)
    Relationship.where(challenger: user)
  end


end