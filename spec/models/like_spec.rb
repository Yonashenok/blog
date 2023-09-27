require 'rails_helper'
RSpec.describe Like, type: :model  do 
    before :each do
        @like = Like.new(user_id: 3, post_id: 1)
    end
    context 'when testing the Like class' do
        it "the forinkey of user must be intger" do
            expect(@like.user_id).to eq(3)
        end
        it "the forinkey of post must be intger" do
            expect(@like.post_id).to eq(1)

        end
    end
end