require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    @post = posts(:one)
  end
  
  test "Should get new" do
    get :new
    assert_response :success
  end
  
  test "Should get edit" do
    get :edit, id: @post
    assert_response :success
  end
  
  test "Should get index" do
    get :index 
    assert_response :success
  end
  
  test "Should get news" do
    get :news
    assert_response :success
  end
  
  test "Should get rumors" do
    get :rumors
    assert_response :success
  end
  
  test "Should get discussion" do
    get :discussion
    assert_response :success
  end
  
  test "Should get show" do
    get :show, id: @post
    assert_response :success
  end
  
  test "Should create new post" do
    assert_difference 'Post.count' do
      post :create, post: { title: 'New Post', link: 'http://www.example.com/', rating: 1, content: 'New content', category: 'discussion' }
    end
    assert_redirected_to discussion_path
  end
  
  test "Should destroy post" do
    assert_difference 'Post.count', -1 do
      @post.destroy
    end
  end
    
end