class FollowsController < ApplicationController

	def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        respond_to do |format|
            format.html {redirect_to tweet_path}
            format.js { render :create}
        end 
    end
    
    def destroy
        @user = Follow.find(params[:id]).followed 
        current_user.unfollow(@user)
        respond_to do |format|
            format.html {redirect_to tweet_path}
            format.js { render :destroy}
        end
    end 

end
