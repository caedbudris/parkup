require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup 
    @user = users(:one)
    @user2 = users(:two)
  end
  
 test "User should be valid" do
   assert @user.valid?
 end
 
 test "has_secure_password should not allow more than 72" do
    @user.password = 'a' * 73
    assert_not @user.valid?
  end
  
  test "names should be unique" do
    @user2.name = @user.name
    assert_not @user2.valid?
  end
  
  test 'names should be present' do
    @user.name = ''
    assert_not @user.valid?
  end
  
  test 'names should not be too long' do
    @user.name = 'a' * 25
    assert_not @user.valid?
  end
  
  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end
  
  test 'valid emails should be valid' do
    valid_emails = ['user@example.com', 'example.user@example.net', 'UserExample@example.co']
    valid_emails.each do |e|
      @user.email = e
      assert @user.valid?
    end
  end
  
  test 'invalid emails should be invalid' do
    invalid_emails = ['useratexample.com', 'user@example,com', 'example,user@example.com']
    invalid_emails.each do |e|
      @user.email = e
      assert_not @user.valid?
    end
  end
  
end
