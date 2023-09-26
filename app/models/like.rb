class Like < ApplicationRecord
  # Association
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  # methods
  def update_like_count
    post.update(likes_counter: post.likes.count)
  end
end
