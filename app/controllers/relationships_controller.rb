class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    other_user = User.find_by(username: params[:username])
    current_user.challenge(other_user)
    render current_user
  end

  def destroy
  end



end
