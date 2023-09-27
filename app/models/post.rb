class Post < ApplicationRecord
  # Association
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'


  # methods
  def update_post_count
    user.update(post_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # validation
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
