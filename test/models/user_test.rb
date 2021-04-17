require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @new_user = User.new
    @zagreus = users(:zagreus)
    @meg = users(:meg)
  end

  test "user has name" do 
    assert_not @new_user.save, "Saved user without name"
  end

  test "user has email" do
    assert_not @new_user.save, "Saved user without email"
  end

  test "users have posts" do
    assert_includes @zagreus.posts, posts(:post1)
    assert_includes @zagreus.posts, posts(:post2)
    assert_not_includes @zagreus.posts, posts(:post3)
  end

  test "users have comments" do
    assert_includes @zagreus.comments, comments(:comment1)
    assert_not_includes @zagreus.comments, comments(:comment2)
    assert_includes @zagreus.comments, comments(:comment3)
  end

  test "only friends with accepted requests are in user#friends" do
    assert_includes @meg.friends, @zagreus
    assert_not_includes @meg.friends, users(:nobody)
  end
end
