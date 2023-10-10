require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  describe 'show page' do
    let(:user1) { User.create(name: 'someone1', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico') }
    let!(:post1) {  Post.create(user: user1, title: 'first ever post 1', text: 'this my post for the first time') }
    let!(:post2) {  Post.create(user: user1, title: 'first ever post 2', text: 'this my post for the first time') }
    let!(:post3) {  Post.create(user: user1, title: 'first ever post 3', text: 'this my post for the first time') }
    before do
      visit user_path(user1)
    end

    it "shows the user's profile picture" do
      expect(page).to have_selector("img[src*='#{user1.photo}']")
    end

    it "shows the user's username" do
      expect(page).to have_content(user1.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('number of posts: 3')
    end

    it "shows the user's bio" do
      expect(page).to have_content('Bio')
      expect(page).to have_content('Teacher from Mexico')
    end

    it "shows the user's first 3 posts" do
      expect(page).to have_content('first ever post 1')
      expect(page).to have_content('first ever post 2')
      expect(page).to have_content('first ever post 3')
    end

    it "shows a button that lets me view all of a user's posts" do
      expect(page).to have_content('See All Post')
    end

    it "When I click a user's post, it redirects me to that post's show page" do
      click_on("Title: #{post1.title}")
      expect(current_path).to eq(user_post_path(user1, post1))
    end

    it "should redirected to the user's post's index page when I click to see all posts " do
      click_on('See All Post')

      expect(current_path).to eq(user_posts_path(user_id: user1.id))
    end
  end
end
