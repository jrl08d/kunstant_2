class ProfilesController < ApplicationController
  before_action :check_user
	
  def index
		@users = User.all
    @projects = current_user.projects
    render :index, layout: "project"
	end

  def portfolioindex
    @projects = Project.where(done: true, user_id: @user)
  end

  def new 
    @user = User.find(params[:id])
  end

	def show 
		@users = User.all
		@user = User.find(params[:id])
		@projects = @user.projects
    @relationship = Relationship.new
    render :show, layout: "portfolio"	
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
