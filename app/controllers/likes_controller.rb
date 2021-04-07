class LikesController < ApplicationController
  before_action :set_post
  
  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    # @like = @post.likes.find_by_user_id(user_id: current_user.id)
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
