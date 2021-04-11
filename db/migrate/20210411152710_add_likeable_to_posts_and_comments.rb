class AddLikeableToPostsAndComments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :post
    add_reference :likes, :likeable, polymorphic: true
  end
end
