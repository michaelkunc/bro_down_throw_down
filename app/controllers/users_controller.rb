class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect "/"
    else
      @errors = @user.errors
      render 'users/new'
    end
  end

end