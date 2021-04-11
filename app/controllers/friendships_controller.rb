class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ update destroy ]

  def index
    # @pending_requests = Friendship.with_user(current_user).pending.includes(:sender)
    @sent_requests = Friendship.sent_by_user(current_user).pending.includes(:receiver)
    @received_requests = Friendship.received_by_user(current_user).pending.includes(:sender)
  end

  def create
    current_user.sent_requests.create!(receiver_id: friendship_params[:friend_id])
    flash[:notice] = "Your friend request has been sent."
    redirect_to users_path
  end

  def update
    @friendship.update(accepted: true)
    flash[:success] = "You are now friends with #{@friendship.sender.name}."
    redirect_to user_friendships_path(current_user)
  end

  def destroy
    @friendship.destroy
    redirect_to user_friendships_path(current_user)
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
