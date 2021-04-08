class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :received_requests, class_name: "Friendship", foreign_key: :receiver_id
  has_many :sent_requests, class_name: "Friendship", foreign_key: :sender_id

  # has_many :friends, through: :received_requests, source: :sender
  # has_many :friends, through: :sent_requests, source: :receiver

  has_many :posts
  has_many :comments
  has_many :likes
end
