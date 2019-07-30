class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name
  scope :following_ids,
    ->(user_id){select(:followed_id).where(follower_id: user_id)}
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
