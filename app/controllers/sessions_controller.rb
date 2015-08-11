class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      log_in(user)
      redirect_to user
    else
      @errors = "Login Unsuccessful"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to :root
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end


end
