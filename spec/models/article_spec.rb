# spec/models/article.rb
   
  require 'rails_helper'
describe Article do 
  it "should have many comments" do
    t = Article.reflect_on_association(:comments)
    t.macro.should == :has_many
  end
  it "has a valid factory" do
      FactoryGirl.create(:article).should be_valid
  end    
  it "is invalid without a title" do
      FactoryGirl.build(:article, title: nil).should_not be_valid
  end     
  it "is invalid without a text" do
      FactoryGirl.build(:article, text: nil).should_not be_valid
  end 
  it "return a article's title as a string" do
      article = FactoryGirl.create(:article, title: "welcome", text: "hello world")
      article.name.should == "welcome hello world"
  end  
  it "returns a sorted array of results that match" do
    smith = FactoryGirl.create(:article, text: "Smith")
    jones = FactoryGirl.create(:article, text: "Jones")
    johnson = FactoryGirl.create(:article, text: "Johnson")
  
    Article.by_letter("J").should == [johnson, jones]
  end

  it "returns a sorted array of results that match" do
    smith = FactoryGirl.create(:article, text: "Smith")
    jones = FactoryGirl.create(:article, text: "Jones")
    johnson = FactoryGirl.create(:article, text: "Johnson")
  
    Article.by_letter("J").should_not include smith
  end
  
  # it "redirects to the home page upon save" do
  #   post :create, article: FactoryGirl.attributes_for(:article)
  #   response.should redirect_to root_url
  # end
  
  describe "filter text by letter" do
      before :each do
        @smith = FactoryGirl.create(:article, text: "Smith")
        @jones = FactoryGirl.create(:article, text: "Jones")
        @johnson = FactoryGirl.create(:article, text: "Johnson")
  end
    context "matching letters" do
        it "returns a sorted array of results that match" do
        Article.by_letter("J").should == [@johnson, @jones]
      end
    end
    
    context "non-matching letters" do
        it "does not return contacts that don't start with the provided letter" do
        Article.by_letter("J").should_not include @smith
      end
    end  
  end
end