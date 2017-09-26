class Reply < ApplicationRecord
	belongs_to :tweet
	belongs_to :user


	 has_many :following, through: :active_relationships, source: :followed
     has_many :followers, through: :passive_relationships, source: :follower
         
         
         # helper methods
         
         # follow another user
         def follow(other)
           active_relationships.create(followed_id: other.id)
         end
         
         # unfollow a user
         def unfollow(other)
           active_relationships.find_by(followed_id: other.id).destroy
         end
         
         # is following a user?
         def following?(other)
           following.include?(other)
         end


end
