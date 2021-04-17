require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @zagreus = users(:zagreus)
    @post = posts(:post2)
  end
  
  test "comment has body" do
    new_comment = Comment.new
    assert_not new_comment.save, "Saved comment without body"
  end

  test "comment belongs to user" do
    assert_includes @zagreus.comments, comments(:comment1)
    assert_includes @zagreus.comments, comments(:comment3)
    assert_not_includes @zagreus.comments, comments(:comment2)
  end

  test "comment belongs to post" do
    assert_includes @post.comments, comments(:comment2)
    assert_includes @post.comments, comments(:comment3)
    assert_not_includes @post.comments, comments(:comment1)
  end
end
