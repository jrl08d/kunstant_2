class ProfilesController < ApplicationController
	def index
		@users = User.all
	end

	def show 
		@user = User.find(params[:id])
		@projects = @user.projects
	end
end
