class User < ApplicationRecord
  require 'open-uri'

  after_create do |user|
    unless user.id <= 10
      seed_friends
      send_welcome_email
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  validates :name, presence: true

  has_many :received_requests, class_name: "Friendship", foreign_key: :receiver_id, dependent: :destroy
  has_many :sent_requests, class_name: "Friendship", foreign_key: :sender_id, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  has_one_attached :profile_pic

  def self.from_omniauth(auth)
    if getExistingUser(auth)
      user = getExistingUser(auth)
    else
      user = User.new
    end

    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.name = auth.info.name
    if auth.info.image
      downloaded_image = URI.open(auth.info.image)
      user.profile_pic.attach(io: downloaded_image, 
                            filename: "image-#{Time.now.strftime("%s%L")}", 
                            content_type: downloaded_image.content_type)
    end
    user.provider = auth.provider
    user.uid = auth.uid

    user.save!
    user
  end

  def friends
    friend_ids = sent_accepteds + received_accepteds
    friends = friend_ids.map do |id|
      User.find(id)
    end
    friends
  end

  private

  def getExistingUser(auth)
    User.find_by(provider: auth.provider, uid: auth.uid) || User.find_by(email: auth.info.email)
  end

  def send_welcome_email
    UserMailer.with(name: self.name, email: self.email).welcome_email.deliver
  end

  def seed_friends
    self.received_requests.create(sender_id: 1, accepted: true)
    self.received_requests.create(sender_id: 2, accepted: true)
    self.received_requests.create(sender_id: 3, accepted: true)
    self.received_requests.create(sender_id: 4, accepted: true)
    self.received_requests.create(sender_id: 5, accepted: true)
    self.received_requests.create(sender_id: 6)
    self.received_requests.create(sender_id: 7)
    self.received_requests.create(sender_id: 8)
    self.received_requests.create(sender_id: 9)
  end

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
