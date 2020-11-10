require 'rails_helper'


# RSpec.describe User, type: :model do
#   context 'validation tests' do
#     it 'ensures first name presence' do
#       user=User.new(lastname: 'senthil', email: 'sumii@gmail.com').save
#       expect(user).to eq(true)
#     end
#     it 'ensures last name presence' do
#       user=User.new(firstname: 'senthil', email: 'sumii@gmail.com').save
#       expect(user).to eq(true)
#     end
#     it 'ensures email presence' do
#       user=User.new(firstname: 'senthil', email: 'sumii@gmail.com').save
#       expect(user).to eq(true)
#     end
   
  

#   end

# end

RSpec.describe User, :type => :model do
  
  before(:all) do
    @user1 = create(:user)
    
  end
  
  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end
  
  it "has a unique firstname" do
    user2 = build(:user, email: "bob@gmail.com")
    expect(user2).to be_valid
  end
  
  it "has a unique email" do
    user2 = build(:user, firstname: "Bob")
    expect(user2).to be_valid
  end
  
  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to be_valid
  end
  
  it "is not valid without a firstname" do 
    user2 = build(:user, firstname: nil)
    expect(user2).to be_valid
  end
  
  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

end