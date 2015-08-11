class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      @errors = "Login Unsuccessful"
      render 'new'
    end
  end

  def destroy

  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end


end
