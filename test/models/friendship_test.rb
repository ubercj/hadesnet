require "test_helper"

class FriendshipTest < ActiveSupport::TestCase
  setup do
    @friendship = friendships(:one)
    @zagreus = users(:zagreus)
    @meg = users(:meg)
  end

  test "friendship has sender" do
    assert_equal @friendship.sender, @zagreus
    assert_includes Friendship.sent_by_user(@zagreus), @friendship
  end

  test "friendship has receiver" do
    assert_equal @friendship.receiver, @meg
    assert_includes Friendship.received_by_user(@meg), @friendship
  end

  test "accepted is false by default" do
    new_friendship = Friendship.new
    assert_not new_friendship.accepted
  end

  test "accepted requests are in is_accepted scope" do
    assert_includes Friendship.is_accepted, @friendship
  end

  test "unaccepted requests are in pending scope" do
    not_accepted_request = friendships(:two)
    assert_includes Friendship.pending, not_accepted_request
  end

  test "friendship with_user scope works" do
    assert_includes Friendship.with_user(@zagreus), @friendship
    assert_includes Friendship.with_user(@meg), @friendship
    assert_not_includes Friendship.with_user(@meg), friendships(:three)
  end
end
