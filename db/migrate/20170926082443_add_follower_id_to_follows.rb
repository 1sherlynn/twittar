class AddFollowerIdToFollows < ActiveRecord::Migration[5.1]
  def change
    add_reference :follows, :follower, foreign_key: true
  end
end
