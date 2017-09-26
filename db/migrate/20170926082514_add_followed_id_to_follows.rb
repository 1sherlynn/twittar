class AddFollowedIdToFollows < ActiveRecord::Migration[5.1]
  def change
    add_reference :follows, :followed, foreign_key: true
  end
end
