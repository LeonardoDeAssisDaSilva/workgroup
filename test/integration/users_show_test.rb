require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:userZ)
  end

  test "should not show unactivated user" do
    get user_path(@user)
    assert_response :redirect
  end
end
