require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "comment has body" do
    comment = Comment.new
    assert_not comment.save, "Saved comment without body"
  end
end
