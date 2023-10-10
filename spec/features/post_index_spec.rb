require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create(name: 'Someone', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico')
    end
    let!(:post) { Post.create(user:, title: 'first ever post', text: 'this my post for the first time') }
    let!(:comment1) { Comment.create(user:, post:, text: 'comment 1') }
    let!(:comment2) { Comment.create(user:, post:, text: 'comment 2') }
    let!(:like1) { Like.create(user:, post:) }

    before do
      visit user_posts_path(user_id: user.id)
    end

    it "shows the user's profile picture" do
        expect(page).to have_selector("img[src*='#{user.photo}']")
    end

    it "shows the user's username" do
        expect(page).to have_content("name: #{user.name}")
    end

    it "shows the number of posts the user has written" do
        expect(page).to have_content('number of posts: 1')
    end

    it "shows a post's title" do
        expect(page).to have_content(post.title)
    end

    it "shows the post's body" do
      expect(page).to have_content("Body: #{post.text}")
    end

    it 'shows the first comments on a post' do
        expect(page).to have_content("comment: #{comment1.text}")
        expect(page).to have_content("comment: #{comment2.text}")
    end

    it 'shows  how many comments a post has' do
        expect(page).to have_content('Comments: 2')
    end

    it 'shows how many likes it has' do
        expect(page).to have_content('Likes: 1')
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_selector('.pagination')
    end

    it "When I click on a post, it redirects me to that post's show page" do
      click_on("Title: #{post.title}")
      expect(current_path).to eq(user_post_path(user, post))
    end
  end
end
