class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter_for_a_post
    Post.find(self.post_id).update(likes_counter: Post.find(self.post_id).likes.count)
  end
end