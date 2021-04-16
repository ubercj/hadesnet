require "test_helper"

class FeedFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:zagreus)
    sign_in @user
    @post = posts(:post1)
    @comment = comments(:comment1)
  end

  test "can see the home feed" do
    get "/"
    assert_select "p", "Welcome to the House of Hades"
  end

  test "can make a post" do
    get new_post_path
    assert_response :success

    post posts_path, params: { post: { body: @post.body } }
    assert_equal "Your post was created successfully.", flash[:notice]
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Post Malone"
  end

  test "can edit a post" do
    get edit_post_path(@post)
    assert_response :success

    patch post_path(@post), params: { post: { body: "Patchy the Pirate" } }
    assert_equal "Your post was updated.", flash[:notice]
    assert_equal "Patchy the Pirate", @post.reload.body # You HAVE to use reload for it to work...
    assert_response :redirect, "Did not redirect after update"
    follow_redirect!
    assert_response :success
    assert_select "p", "Patchy the Pirate"
  end

  test "can delete a post" do
    assert_difference("Post.count", -1) do
      delete post_path(@post)
    end

    assert_redirected_to root_path
  end

  test "can create a comment" do
    get new_post_comment_path(@post)
    assert_response :success

    post post_comments_path(@post), params: { comment: { body: @comment.body, user_id: @user.id } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Blood and Darkness"
  end

  test "can edit a comment" do
    get edit_post_comment_path(@post, @comment)
    assert_response :success

    patch post_comment_path(@post, @comment), params: { comment: { body: "Blast!", user_id: @user.id } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Blast!"
  end

  test "can delete a comment" do
    assert_difference("Comment.count", -1) do
      delete post_comment_path(@post, @comment)
    end

    assert_redirected_to root_path
  end
end
