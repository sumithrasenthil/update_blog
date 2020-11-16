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
    @user1 = build(:user)
    @users=create(:user)
  end

  context "validations" do
    it "is valid with valid attributes" do
      user2=build(:user,email: "example@gmail.com")
      expect(user2).to be_valid
    end
    
    it "is  valid with firstname" do
      user2 = build(:user, firstname: "sumi",email:"sumi@gmail.com")
      expect(user2).to be_valid
      
    end
    

    it "is  valid  if password is  equal to password confirmation" do 
      user2 = build(:user,email: "sumi@gmail.com",password: "1234567",password_confirmation: "1234567")
      expect(user2).to be_valid
    end
  end

  context 'invalid' do
  
      it "is not valid without firstname" do
        user2 = build(:user, firstname: nil, email:"sumi@gmail.com")
        expect(user2).to_not be_valid
      end
      
      it "is not valid without a password" do 
        user2 = build(:user,email:"sumi@gmail.com", password: nil,password_confirmation: nil)
        expect(user2).to_not be_valid
      end

      it "is not valid without if password is not equal to password confirmation" do 
        user2 = build(:user, password: "1234567",email: "sumi@gmail.com")
        expect(user2).to_not be_valid
      end

      

      
      it "is not valid without a lastname" do 
        user2 = build(:user, lastname: nil,email:"sumi@gmail.com")
        expect(user2).to_not be_valid
      end
      
      it "is not valid without an email" do
        user2 = build(:user, email: nil)
        expect(user2).to_not be_valid
      end

      
  end

  
  context "user fullname" do
      let(:user1) {FactoryBot. build(:user)}

      it "should have a valid fullname" do
          expect(user1.fullname).to eql user1.firstname + " " + user1.lastname
      end

  end
    
  context "display email" do
    let (:user1) {FactoryBot. build(:user)}
    it "display email should match email " do
      expect(user1.display_email).to eql user1.email
    end

  end
  
  # context "user articles" do

  #   let(:user) {FactoryBot. create(:user,email: "xyx@xyx.com")}
  #   let(:article1) {FactoryBot.create(:article,user_id: user.id)}
  #   it "display whether author has an artcile or not" do
  #     expect(user.is_author).to eql false
  #     # expect(article1).to_not be_valid
  #   end

  # end


end