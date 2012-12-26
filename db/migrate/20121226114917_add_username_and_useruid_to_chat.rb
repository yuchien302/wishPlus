class AddUsernameAndUseruidToChat < ActiveRecord::Migration
  def change
    add_column :chats, :username, :string
    add_column :chats, :useruid, :integer
  end
end
