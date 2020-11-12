FactoryBot.define do
  
   
  factory :article do
    user
    title {"respec"}
    body {"checkig....."}
    user_id {1}
  end
    
  
  
  factory :user  do
    firstname { "factorys" }
    email { "facry@gmail.com" }
    lastname { "bots" }
    password { "123456" }
    password_confirmation {"123456"}
  end

  factory :comment do
    user
    article
    body {"checking"}
    article_id {1}
    user_id {1}
  end
  
    
  
    
    
end