class Post < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :user
  has_many :likes
  has_many :comments
  accepts_nested_attributes_for :comments

  has_one_attached :photo

  def pretty_time
    self.created_at.strftime("%b %-d at %l:%M %P")
  end
end
