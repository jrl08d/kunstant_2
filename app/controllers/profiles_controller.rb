class ProfilesController < ApplicationController
	def index
		@users = User.all
	end


  def new
    
    @user = User.find(params[:id])
  end

	def show 
		@users = User.all
		@user = User.find(params[:id])
		@projects = @user.projects
    @posts = current_user.posts
    @relationship = Relationship.new
	end

  def following 
    @title =  "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: param[:page])
    render 'show_follow'
  end

  def followers 
    @title =  "Followers"
    @user = User.find(param[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
end
