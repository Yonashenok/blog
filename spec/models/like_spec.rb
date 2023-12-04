require 'rails_helper'
RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'someone', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', post_counter: 4) }
  before { user.save }

  let(:post) do
    Post.new(title: 'Welcome', text: 'Nice photos', comments_counter: 2, likes_counter: 0, author_id: user.id)
  end

  before { post.save }
  let(:like) { Like.new(user_id: user.id, post_id: post.id) }
  before { like.save }

  context 'when testing the Like class' do
    it 'the forinkey of user must be intger' do
      expect(like.user_id).to eq(user.id)
    end
    it 'the forinkey of post must be intger' do
      expect(like.post_id).to eq(post.id)
    end
    it 'should return the correct numeber of like count' do
      count = like.update_like_count
      expect(count).to eq(1)
    end
  end
end
