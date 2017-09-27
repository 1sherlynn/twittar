class LikesController < ApplicationController

  def create       
      @tweet = Tweet.find(params[:tweet_id])
      like_params = params.permit(:user_id, :tweet_id)
      @like = Like.create(:user_id => current_user.id, :tweet_id => @tweet.id)
  end


  def destroy 
      @tweet = Tweet.find(params[:tweet_id])
      @like = Like.find_by(:user_id => current_user.id, :tweet_id => @tweet.id)
      # @like = Like.find_by(tweet_id: params[:tweet_id], user_id: params[:user_id])
      @like.destroy
  end 


  def new
    @like = Like.new(like_params)
  end


  def show
  end 


private
  def like_params 
    params[:like].permit(:user_id, :tweet_id)
  end 

end