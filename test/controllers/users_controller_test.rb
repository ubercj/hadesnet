require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:zagreus)
  end

  test "should get show" do
    sign_in @user
    get user_path(@user)
    assert_response :success
  end
end
