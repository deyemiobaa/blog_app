class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :text, presence: true
  validates :post, presence: true
  after_create :update_comments_counter_for_a_post
  after_update :update_comments_counter_for_a_post

  def update_comments_counter_for_a_post
    Post.find(post_id).update(comments_counter: Post.find(post_id).comments.count)
  end
end
