require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'someone', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', post_counter: 4) }
  before { user.save }

  context 'when testing User class' do
    it 'must have user name' do
      user.name = nil
      expect(user).to_not be_valid
    end
    it 'the post_counter must be integer ' do
      user.post_counter = ''
      expect(user).to_not be_valid
    end
    it 'the post_counter must be greater than zero' do
      user.post_counter = -1
      expect(user).to_not be_valid
    end

    it 'should return three recent posts ' do
      5.times do
        Post.create(title: 'Welcome', text: 'Nice photos', comments_counter: 2, likes_counter: 10, author_id: user.id)
      end
      count = user.recent_post
      expect(count.length).to eq(3)
    end
  end
end
