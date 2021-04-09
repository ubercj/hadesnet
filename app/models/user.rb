class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  validates :name, presence: true

  has_many :received_requests, class_name: "Friendship", foreign_key: :receiver_id
  has_many :sent_requests, class_name: "Friendship", foreign_key: :sender_id

  # has_many :friends, through: :received_requests, source: :sender
  # has_many :friends, through: :sent_requests, source: :receiver

  has_many :posts
  has_many :comments
  has_many :likes

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def friends
    friend_ids = sent_accepteds + received_accepteds
    friends = friend_ids.map do |id|
      User.find(id)
    end
    friends
  end

  private

  def sent_accepteds
    output = []
    self.sent_requests.is_accepted.each do |friendship|
      output << friendship.receiver_id
    end
    output
  end

  def received_accepteds
    output = []
    self.received_requests.is_accepted.each do |friendship|
      output << friendship.sender_id
    end
    output
  end
end
