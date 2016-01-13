require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
     @user = users(:one) 
  end
  
  test "should get new" do
      get :new
      assert_response :success
  end
  
  test "should get show" do
      get :show, id: @user.id
      assert_response :success
  end
  
  test "should create user" do
    assert_difference "User.count" do    
        post :create, user: { name: "AldoRain", email: "aldo@rain.com", park: "Great America", password: "naziscalps" }
     end
     assert_not session[:user_id].nil?
  end
  
  test "should destroy user" do
      assert_difference "User.count", -1 do
          @user.destroy
      end
  end
  
end
