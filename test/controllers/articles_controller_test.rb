require 'rails_helper'
require 'spec_helper'

class ArticlesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "new" do
    article = Article.new
    assert(:article)
  end

  # test "create" do
  #   article = Article.new(:article)
  #   assert_throws(:article) 
  #   if article.save
  #   else
  #     render 'test_new'
  #   end
  # end
      



   test "create" do
     assert_difference('Article.count') do
     post :create, article: {title: 'Some title', text: 'hello to all'}
   end
 
    assert_redirected_to article_path(assigns(:article))
 end
   
#    test "should "

#   test "should get index" do
#     get :index
#       assert_response :success
#       assert_not_nil assigns(:articles)
# end 
end
