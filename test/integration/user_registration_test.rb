require "test_helper"

class UserRegistrationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "user can sign up successfully" do
    get new_user_registration_path
    assert_response :success

    post "/users", params: { name: "Persephone", email: "persephone@elysium.net", password: "mygarden", password_confirmation: "mygarden" }
    assert_response :success

    assert_difference("User.count", 1) do
      post "/users", params: { name: "Chaos", email: "chaos@chaos.net", password: "primordial", password_confirmation: "primordial" }
    end
  end
end
