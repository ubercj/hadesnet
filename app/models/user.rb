class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :accepted_requests, class_name: "FriendRequest", foreign_key: :receiver_id
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: :sender_id
  has_many :posts
end
