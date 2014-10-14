class RelationshipsController < ApplicationController
  def create 
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to profile_path(@user)
    #   format.js
  end

  def destroy
    @user = User.find(Relationship.find(params[:id]).followed_id)
    current_user.unfollow!(@user)
    redirect_to profile_path(@user)
  end
end
