class RepliesController < ApplicationController


	def create

		tweet = Tweet.find(params[:tweet_id])
		reply_params = params.require(:reply).permit(:userid, :body)
		reply = tweet.replies.new(reply_params)
		reply.user_id = current_user.id
		if reply.save
			flash[:success] = "New Reply added."
		else
			byebug
			flash[:danger] = "New Reply not added."
		end
		redirect_to tweets_path

	end



end
