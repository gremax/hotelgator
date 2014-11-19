require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:user_first)
  end
      
  test "invalid name gives error message" do
    @user.name = nil
    @user.valid?
    assert_match /can't be blank/, @user.errors[:name].join,
      "Presence error not found on user"
  end
  
  test "invalid email gives error message" do
    @user.email = nil
    @user.valid?
    assert_match /can't be blank/, @user.errors[:email].join,
      "Presence error not found on email"
  end

  test "should respond to hotels" do
    assert_respond_to @user, :hotels
  end
  
  test "should contain hotels that belong to user" do
    assert @user.hotels.all? { |h| h.user == @user }
  end
end
