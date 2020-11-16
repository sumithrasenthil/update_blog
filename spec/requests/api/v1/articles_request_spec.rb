require 'rails_helper'

RSpec.describe "API V1 Articles", type: 'request' do
    

        context 'unauthorized' do
            it "should 401" do
              get '/api/v1/articles'
              expect(response).to have_http_status(:unauthorized)
            end
          end
        
          context 'authorized' do
            let!(:application) { FactoryBot.create(:application) }
            let!(:user)        { FactoryBot.create(:user,email: "check@gmail.com") }
            let!(:token)       { FactoryBot.create(:access_token, application: application, resource_owner_id: user.id) }
        
            it 'succeeds' do
              get '/api/v1/articles', params: {}, headers: { 'Authorization': 'Bearer ' + token.token }
              expect(response).to be_successful
            end
          end

        


end
