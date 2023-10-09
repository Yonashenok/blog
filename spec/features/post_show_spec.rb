require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  describe 'show page' do
    let(:user) do
      User.create(name: 'Someone', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico')
    end
    let!(:post) { Post.create(user:, title: 'first ever post', text: 'this my post for the first time') }
    let!(:comment1) { Comment.create(user:, post:, text: 'comment 1') }
    let!(:comment2) { Comment.create(user:, post:, text: 'comment 2') }
    let!(:like1) { Like.create(user:, post:) }

    before do
      visit user_post_path(user, post)
    end

    it "shows  the post's title" do
      expect(page).to have_content(post.title)
    end

    it 'shows who wrote the post' do
      expect(page).to have_content("by #{user.name}")
    end

    it 'shows how many comments it has' do
      expect(page).to have_content('Comments: 2')
    end

    it 'shows how many likes it has' do
      expect(page).to have_content('Likes: 1')
    end

    it 'shows the post body' do
      expect(page).to have_content("Body: #{post.text}")
    end

    it 'shows the username of each commentor' do
      expect(page).to have_content("username: #{user.name}")
    end

    it 'shows  the comment each commentor left' do
      expect(page).to have_content("comment: #{comment1.text}")
      expect(page).to have_content("comment: #{comment2.text}")
    end
  end
end
