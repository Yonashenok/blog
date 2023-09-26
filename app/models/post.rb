class Post < ApplicationRecord
  # Association
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'
  def update_post_count
    user.update(post_counter: user.posts.count)
  end

  # methods
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
