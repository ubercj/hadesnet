require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "post has body" do
    post = Post.new
    assert_not post.save, "Saved post without body"
  end
end
