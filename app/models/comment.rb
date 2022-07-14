class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter_for_a_post
    Post.find(self.post_id).update(comments_counter: Post.find(self.post_id).comments.count)
  end
end