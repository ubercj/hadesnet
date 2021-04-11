class Friendship < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  scope :is_accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }

  scope :sent_by_user, -> (user) { where(sender_id: user.id) }
  scope :received_by_user, -> (user) { where(receiver_id: user.id) }
  scope :with_user, -> (user) { sent_by_user(user).or(received_by_user(user)) }
end
