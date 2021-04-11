class LikesController < ApplicationController
  before_action :set_post, only: %i[ create ]
  before_action :set_comment, only: %i[ comment_like_create ]
  
  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  def comment_like_create
    @comment.likes.create(user_id: current_user.id)
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
