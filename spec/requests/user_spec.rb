require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a success response' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:id' do
    let(:user) do
      User.create(name: 'Luna', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico.', post_counter: 2)
    end
    it 'returns a success response' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(user)
      expect(response.body).to include('This is user detail')
    end
  end
end
