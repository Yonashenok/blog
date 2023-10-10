require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  describe 'index page' do
    before :each do
      @user1 = User.create(name: 'someone1', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico')
      @user2 = User.create(name: 'someone2', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Ethiopia')
      @user3 = User.create(name: 'someone3', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Kenya')
      Post.create(user: @user1, title: 'rails awosome', text: 'Hello Tom!')
      Post.create(user: @user2, title: 'rails awosome', text: 'Hello Tom!')
      Post.create(user: @user2, title: 'rails awosome', text: 'Hello Tom!')
      Post.create(user: @user3, title: 'rails awosome', text: 'Hello Tom!')
      Post.create(user: @user3, title: 'rails awosome', text: 'Hello Tom!')
      Post.create(user: @user3, title: 'rails awosome', text: 'Hello Tom!')
      visit root_path
    end

    it 'shows the username of all other users' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end

    it 'shows the profile picture for each user' do
      expect(page).to have_selector("img[src*='#{@user1.photo}']")
      expect(page).to have_selector("img[src*='#{@user2.photo}']")
      expect(page).to have_selector("img[src*='#{@user3.photo}']")
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content('number of posts: 1')
      expect(page).to have_content('number of posts: 2')
      expect(page).to have_content('number of posts: 3')
    end
    it 'should redirected to that users show page when I click on a user ' do
      click_link @user1.name

      expect(current_path).to eq(user_path(@user1))
    end
  end
end
