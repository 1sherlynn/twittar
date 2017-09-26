class FollowsController < ApplicationController

	def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        redirect_to root_path
    end
    
    def destroy
        user = Follow.find(params[:id]).followed 
        current_user.unfollow(user)
        redirect_to root_path
    end
end
