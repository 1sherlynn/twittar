class RepliesController < ApplicationController

	def create
		@tweet = Tweet.find(params[:tweet_id])
		@user = User.find(@tweet.user_id)
		reply_params = params.require(:reply).permit(:user_id, :body)
		@reply = @tweet.replies.create(reply_params)
		@reply.user_id = current_user.id
		if @reply.save
			TweetMailer.new_reply(@reply).deliver_later 
			flash[:success] = "New Reply added."
	
		else
			flash[:danger] = "New Reply not added."
		end

	end 

end 