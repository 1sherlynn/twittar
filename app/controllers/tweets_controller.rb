class TweetsController < ApplicationController
	before_action :authenticate_user! , except: [:index, :home]
	before_action :find_tweet, only: [:show, :edit, :update, :destroy]

	def create
		@tweet = current_user.tweets.new(tweet_params)
		@tweet.user_id = current_user.id
		if @tweet.save
			redirect_to root_path, notice: "Tweet posted."
		else
			render 'new'
		end
	end


	def destroy
		@tweet.destroy
		redirect_to root_path
	end


	def edit
	end


	def home
	    following = Array.new
	    	for @f in current_user.following do
	      		following.push(@f.id)
	    	end
	    @tweets = Tweet.where("user_id IN (?)", following)
	    @newTweet = Tweet.new
	    @newReply = Reply.new
   	end


	def index
	    @tweets = Tweet.all.order("created_at DESC")
	    @newTweet = Tweet.new
	    @latestUsers = User.all.last(5)
		@reply = Reply.new
		@like = Like.all
		@usertweet = Tweet.all.where(User.find_by_username(params[:id]))
		@users = User.all 
	end


	def new
		@tweet = current_user.tweets.new
	end


   	def profile
    # grab the username from the URL as :id
	if (User.find_by_username(params[:id]))
	    @username = params[:id]
	else 
	
	    redirect_to root_path, :notice=> "User not found!" 
	    end
	    @tweets = Tweet.all.where("user_id = ?", User.find_by_username(params[:id]).id)
	    @newTweet = Tweet.new
	    @latestUsers = User.all.last(5)
	    


  	end


	def show
		@tweet = Tweet.find(params[:id])
		@user = User.find(@tweet.user_id)
		@tweets = @user.tweets
		@newTweet = Tweet.new
		@replies = Reply.where(tweet_id: @id)
		@tweets = Tweet.all.where("user_id = ?", User.find(@tweet.user_id))
  	end


	def update
		if @tweet.update(tweet_params)
			redirect_to @tweet, notice: "Tweet updated."
		else
			render 'edit'
		end
	end


	private
	def tweet_params
		params.require(:tweet).permit(:tweet, :avatar, :user_id)
	end

	def find_tweet
		@tweet = Tweet.find(params[:id])
	end

end
