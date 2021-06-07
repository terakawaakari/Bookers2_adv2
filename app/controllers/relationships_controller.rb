class RelationshipsController < ApplicationController
  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

end
