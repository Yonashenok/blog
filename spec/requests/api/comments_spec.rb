require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
    
    path '/api/v1/users/{user_id}/posts/{post_id}/comments' do

        parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
        parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
    
        get('list comments') do
          response(200, 'successful') do
            let(:user_id) { '2' }
            let(:post_id) { '11' }
    
            after do |example|
              example.metadata[:response][:content] = {
                'application/json' => {
                  example: JSON.parse(response.body, symbolize_names: true)
                }
              }
            end
            run_test!
          end
        end
    
        post('create comment') do
          response(200, 'successful') do
            let(:user_id) { '2' }
            let(:post_id) { '11' }
    
            after do |example|
              example.metadata[:response][:content] = {
                'application/json' => {
                  example: JSON.parse(response.body, symbolize_names: true)
                }
              }
            end
            run_test!
          end
        end
      end
end
