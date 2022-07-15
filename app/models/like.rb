class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_create :update_likes_counter_for_a_post

  def update_likes_counter_for_a_post
    Post.find(post_id).update(likes_counter: Post.find(post_id).likes.count)
  end
end
