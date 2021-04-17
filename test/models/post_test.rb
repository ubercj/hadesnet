require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @zagreus = users(:zagreus)
    @post = posts(:post2)
  end
  
  test "post has body" do
    new_post = Post.new
    assert_not new_post.save, "Saved post without body"
  end

  test "posts have comments" do
    assert_not_includes @post.comments, comments(:comment1)
    assert_includes @post.comments, comments(:comment2)
    assert_includes @post.comments, comments(:comment3)
  end

  test "posts belong to users" do
    post1 = posts(:post1)
    post2 = posts(:post2)
    post3 = posts(:post3)

    assert_equal post1.user, @zagreus
    assert_equal post2.user, @zagreus
    assert_not_equal post3.user, @zagreus
  end
end
