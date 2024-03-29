class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy, foreign_key: :author_id
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :author_id
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def top_three_recent_posts
    posts.includes(:author).order(created_at: :DESC).limit(3)
  end

  def isadmin?
    role == 'admin'
  end
end
