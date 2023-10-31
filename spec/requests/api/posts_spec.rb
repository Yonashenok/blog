require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
    path "/api/v1/users/{user_id}/posts" do
        parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
        get('User Posts') do
            response(200, 'successful') do
                let(:user_id) { '2' }

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
