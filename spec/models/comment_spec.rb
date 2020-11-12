require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment1= build(:comment)
    @user =create(:user,email: "comment@gmail.com")
    @article =create(:article)
  end
  
  context "Validations" do
      it "is valid for attributes" do
        expect(@comment1).to be_valid
      end
  end

  context "Invalid" do

      it "is not valid without user_id" do
        comment2=build(:comment,user_id: nil)
        expect(comment2).to_not be_valid
      end

      it "is not valid without article_id" do
        comment2=build(:comment,article_id: nil)
        expect(comment2).to_not be_valid
      end

      it "is not valid without body" do
        comment2 =build(:comment,body: nil)
        expect(comment2).to_not be_valid
      end

  end



end
