require 'rails_helper'

RSpec.describe "API V1 Articles", type: 'request' do
    
        before(:all) do
          @article1 = create(:article)
          
        end

        context 'unauthorized' do
            it "should 401" do
              get '/api/v1/articles'
              expect(response).to have_http_status(:unauthorized)
            end
        end
        
        context 'authorized' do
          let(:application) { FactoryBot.create(:application) }
          let(:user)        { FactoryBot.create(:user,email: "check@gmail.com") }
          let(:token)       { FactoryBot.create(:access_token, application: application, resource_owner_id: user.id) }
      
          it 'show the articles should return successful' do
            get '/api/v1/articles', headers: { 'Authorization': 'Bearer ' + token.token }
            
            expect(response).to be_successful
          end
          
          it 'post the article should return successful' do
            post '/api/v1/articles', :params => {:article => { :title => "check", :body => "test", :user_id => 1}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
          end

          it 'update the article should return successful' do
            put '/api/v1/articles/1', :params => {:article => { :title => "check", :body => "test", :user_id => 1}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
          end

          it 'delete the article should return successful' do
            delete '/api/v1/articles/1', headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
          end

          it 'show the particular article should return successful' do
            get '/api/v1/articles/1', :params => {:article => { :title => "check", :body => "test", :user_id => 1}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to be_successful
          end
          
        end
    
        


end
