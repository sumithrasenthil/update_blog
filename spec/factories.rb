FactoryBot.define do
  
   
  factory :article do
    user
    title {"respec"}
    body {"checkig....."}
    user_id {1}
  end
    
  
  
  factory :user  do
    firstname { "factorys" }
    email { "fac@gmail.com" }
    lastname { "bots" }
    password { "123456" }
    password_confirmation {"123456"}
  end

  factory :comment do
    user
    article
    body {"checking"}
    article_id {1}
    user_id {2}
  end

  factory :access_token, class: "Doorkeeper::AccessToken" do
    application
    expires_in { 2.hours }
    scopes { "public" }
  end

  factory :application, class: "Doorkeeper::Application" do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:redirect_uri)  { |n| "https://example#{n}.com" }
  end
  
    
  
    
    
end