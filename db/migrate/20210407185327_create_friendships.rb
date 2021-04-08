class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :sender, class_name: "User"
      t.references :receiver, class_name: "User"

      t.timestamps
    end
  end
end
