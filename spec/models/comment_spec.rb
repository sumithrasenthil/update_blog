require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment1= build(:comment)
  end
  
  it "is valid for attributes" do
    expect(@comment1).to be_valid
  end

  it "is not valid without user_id" do
    comment2=build(:comment,user_id: nil)
    expect(comment2).to be_valid
  end

  it "is not valid without article_id" do
    comment2=build(:comment,article_id: nil)
    expect(comment2).to be_valid
  end



end
