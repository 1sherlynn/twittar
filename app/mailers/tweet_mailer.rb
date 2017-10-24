class TweetMailer < ApplicationMailer 
	 
	def new_reply(reply) 
		@reply = reply
		@tweet = @reply.tweet 
		mail(to: @tweet.user.email, subject: 'Twitter: Your tweet received a reply!')
	end

end
