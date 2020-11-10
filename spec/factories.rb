FactoryBot.define do
  factory :article do
    title {"respec"}
    body {"checkig....."}
    user_id {2}
  end

  
    factory :user do
      firstname { "respecs" }
      email { "respecs@gmail.com" }
      lastname { "testing" }
      password { "123456" }
    end
    
end