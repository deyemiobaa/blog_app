class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'

  def update_post_counter_for_user
    self.author.update(posts_counter: self.author.posts.count)
  end

  def return_the_5_most_recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end
end