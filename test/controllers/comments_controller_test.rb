require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:zagreus)
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should get new" do
    get new_post_comment_url(@post)
    assert_response :success
  end

  # test "should create comment" do
  #   assert_difference('Comment.count') do
  #     post post_comments_url(@post), params: { comment: { body: @comment.body, user_id: 1 }, post_id: @post.id }
  #   end

  #   assert_redirected_to post_comment_url(@post, Comment.last)
  # end

  # test "should get edit" do
  #   get edit_post_comment_url(@post, @comment), params: { id: @comment.id }
  #   assert_response :success
  # end

  # test "should update comment" do
  #   patch post_comment_url(@post, @comment), params: { comment: { body: @comment.body, user_id: 1 }, id: @comment.id, post_id: @post.id }
  #   assert_redirected_to post_comment_url(@post, @comment)
  # end

  # test "should destroy comment" do
  #   assert_difference('Comment.count', -1) do
  #     delete post_comment_url(@post, @comment), params: { id: @comment.id, post_id: @post.id }
  #   end

  #   assert_redirected_to root_path
  # end
end
