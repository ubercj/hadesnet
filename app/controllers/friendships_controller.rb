class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ update destroy ]

  def index
    @pending_requests = current_user.received_requests.all
  end

  def create
    current_user.sent_requests.create!(receiver_id: friendship_params[:friend_id])
    flash[:notice] = "Your friend request has been sent."
    redirect_to root_path
  end

  def update
    @friendship.update(accepted: true)
    flash[:success] = "You are now friends with #{@friendship.sender.name}."
    redirect_to friendships_path
  end

  def destroy
    @friendship.destroy
    redirect_to friendships_path
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
