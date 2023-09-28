require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'someone', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', post_counter: 4) }
  before { user.save }

  let(:post) do
    Post.new(title: 'Welcome', text: 'Nice photos', comments_counter: 2, likes_counter: 10, author_id: user.id)
  end
  before { post.save }
  context 'when testing the Post class' do
    it 'the title must be present' do
      post.title = nil
      expect(post).to_not be_valid
    end
    it 'the title must be greater than 250' do
      post.title = 't' * 251
      expect(post).to_not be_valid
    end
    it 'the comments_counter must be integer ' do
      post.comments_counter = ''
      expect(post).to_not be_valid
    end
    it 'the comments_counter must be greater than zero' do
      post.comments_counter = -1
      expect(post).to_not be_valid
    end
    it 'the likes_counter must be integer ' do
      post.likes_counter = ''
      expect(post).to_not be_valid
    end
    it 'the likes_counter must be greater than zero' do
      post.likes_counter = -1
      expect(post).to_not be_valid
    end
  end

  describe '#recent_comments' do
    it 'it should return 5 recent comments' do
      7.times { Comment.create(text: 'comment 1', user_id: user.id, post_id: post.id) }
      latest_posts = post.recent_comments
      expect(latest_posts.length).to eq(5)
    end
  end
end
