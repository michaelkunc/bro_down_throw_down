class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :destroy, :challenged, :challengers]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      # UserMailer.welcome_email(@user).deliver
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
    @user = requested_user
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'users/edit'
    end
  end

  def destroy
    requested_user.destroy
    redirect_to 'users/index'
  end

  def search
    @users = User.text_search(params[:query])
    render 'users/index'
  end

  def add_to_skills
    @user = requested_user
    Skill.new(user: @user, style: params[:style_id])
    render 'users/show'

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