require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create user" do
    assert_difference 'User.count', +1 do
      post :create, user: { name: 'CoasterMan', email: 'coaster@example.com', park: "King's Island", password: '123456789' } 
    end
  end
  
  test "should delete a user" do
    assert_difference 'User.count', -1 do
      @user.destroy
    end
  end
  
end
