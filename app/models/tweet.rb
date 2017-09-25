class Tweet < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :tweet, presence: true, length: { maximum: 140 }

  has_many :replies

  mount_uploader :avatar, AvatarUploader
end
