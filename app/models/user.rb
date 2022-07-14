class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: :author_id
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :author_id

  def top_three_recent_posts
    self.posts.order(created_at: :desc).limit(3)
  end
end