class TweetsController < ApplicationController
	before_action :authenticate_user! , except: [:index, :home]
	before_action :find_tweet, only: [:show, :edit, :update, :destroy]
	
	 def index 
	    @tweets = Tweet.all.order("created_at DESC")
	    @newTweet = Tweet.new
	    @toFollow = User.all.last(10)
	  end

	def home
	end

	def show
  	end

	def new
		@tweet = current_user.tweets.new
	end

	def create
		@tweet = current_user.tweets.new(tweet_params)
		@tweet.user_id = current_user.id
		if @tweet.save
			redirect_to root_path, notice: "Tweet posted."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @tweet.update(tweet_params)
			redirect_to @tweet, notice: "Tweet updated."
		else
			render 'edit'
		end
	end

	def destroy
		@tweet.destroy
		redirect_to root_path
	end


  
	private
	def tweet_params
		params.require(:tweet).permit(:tweet, :avatar, :user_id)
	end

	def find_tweet
		@tweet = Tweet.find(params[:id])
	end
end
