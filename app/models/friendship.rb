class Friendship < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  scope :is_accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }

  scope :with_user, -> (user) { where(sender_id: user.id).or(where(receiver_id: user.id)) }
end
