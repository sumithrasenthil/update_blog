require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @article1 = create(:article)
    
  end
  it "is valid with valid attributes" do
    expect(@article1).to be_valid
  end

  it "is not valid without a body" do 
    article2 = build(:article, body: nil)
    expect(article2).to be_valid
  end
  
  it "is not valid without a title" do 
    article2 = build(:article, title: nil)
    expect(article2).to_not be_valid
  end

  it "is not valid without a user_id" do 
    article2 = build(:article, user_id: nil)
    expect(article2).to_not be_valid
  end

end
