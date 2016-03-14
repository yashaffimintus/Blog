require 'rails_helper'
require 'shoulda-matchers'
require 'shoulda-context'
describe Article do
  describe "#with_comments_by" do
    it "finds articles with comments by the submitted comment_commenter" do
      article = FactoryGirl.create(:article)
      article.comments << FactoryGirl.build(:comment, :commenter => "jdoe", :body => "hello to all")
      Article.with_comments_by("jdoe").should eql?([article])
      Article.with_comments_by("hello to all").should eql?([article])
    end  
  end  
end