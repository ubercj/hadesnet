class Post < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments

  has_one_attached :photo
end
