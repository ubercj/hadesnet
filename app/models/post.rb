class Post < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments
  accepts_nested_attributes_for :comments

  has_one_attached :photo
end
