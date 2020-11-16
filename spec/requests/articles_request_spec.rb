require 'rails_helper'

RSpec.describe "Articles", type: :request do

    context "Article#new" do
    
       it "redirect to login page if the user is not logged in " do
            get new_article_path
            expect(response).to redirect_to new_user_session_path
       end

     #   it "show the articles create page" do
     #        get new_article_path
     #        post "/articles",:params => {:article => {:title => "check", :body => "testing", :id => "1"}}
     #        expect(response).to redirect_to article_path[assigns(:article)]
     #   end
    end

    # describe "POST" do
    #     it ""
    # end



end
