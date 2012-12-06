class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :story_id
      t.string :message

      t.timestamps
    end
  end
end
