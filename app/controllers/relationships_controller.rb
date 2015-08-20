class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    other_user = User.find_by(username: params[:username])
    current_user
    challenge(current_user, other_user)
    redirect_to current_user
  end


  def destroy
    Relationship.find_by(id: params[:id]).destroy
    redirect_to current_user
  end



  private
  def challenge(user, other_user)
    Relationship.create({challenger_id: user.id, challenged_id: other_user.id})
  end

end
