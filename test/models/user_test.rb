require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new
  end

  test "user has name" do 
    assert_not @user.save, "Saved user without name"
  end

  test "user has email" do
    assert_not @user.save, "Saved user without email"
  end
end
