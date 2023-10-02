require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  
  describe 'GET /users/:user_id/posts' do
    let(:user) { User.create(name: 'Luna', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico.', post_counter: 2)  } 
   
    it 'returns a success response' do
      get user_posts_path(user)  
      expect(response).to have_http_status(:success)
    end
    it "renders the index template" do
      get user_posts_path(user)
      expect(response).to render_template("index")
    end
  end
  
  describe 'GET /users/:user_id/posts/:id' do
    let(:user) { User.create(name: 'Luna', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico.', post_counter: 2)  } 
    let(:post) do
      user.posts.create(title: 'Sample Post', text: 'My new post', comments_counter: 1, likes_counter: 1)
    end
    it 'returns a success response' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end
   
    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
  end
end
