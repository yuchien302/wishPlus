class ChangeDataTypeForChatUseruid < ActiveRecord::Migration
  def up
    change_table :chats do |t|
      t.change :useruid, :string
    end
  end

  def down
    change_table :chats do |t|
      t.change :useruid, :integer
    end
  end
end
