require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    @post = posts(:one)
    @user = users(:one)
  end
  
  test "should get new" do
     session[:user_id] = @user.id
     get :new
     assert_response :success
  end
  
  test "should create new post" do
      session[:user_id] = @user.id
      assert_difference "Post.count" do
          post :create, post: { title: "New Rollercoaster", link: "http://www.example.com/", content: "New rollercoaster at the park", category: "news" }
      end
  end
  
  test "should get edit" do
      session[:user_id] = @user.id
      get :edit, id: @post
      assert_response :success
  end
  
  test "should not get edit if not logged in" do
    get :edit, id: @post
    assert_redirected_to login_path
  end
  
  test "should get show" do
    get :show, id: @post
    assert_response :success
  end
    
end