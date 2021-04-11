module ApplicationHelper

  def user_profile_pic(user, size = 128)
    if user.profile_pic.attached?
      user.profile_pic.variant(resize: "#{size}x#{size}")
    else
      gravatar_image_url(user.email, size: size, alt: user.name)
    end
  end

  def pretty_time(model)
    model.created_at.strftime("%b %-d at %l:%M %P")
  end
  
  def find_request(user1, user2)
    if user1.sent_requests.any? { |request| request.receiver_id == user2.id }
      request = Friendship.where(sender_id: user1.id, receiver_id: user2.id).take
    else
      request = Friendship.where(sender_id: user2.id, receiver_id: user1.id).take
    end
    request
  end
  
  def has_request?(user1, user2)
    user1.sent_requests.any? { |request| request.receiver_id == user2.id } || user1.received_requests.any? { |request| request.sender_id == user2.id }
  end

  def is_friend?(user1, user2)
    has_request?(user1, user2) && find_request(user1, user2).accepted
  end
end
