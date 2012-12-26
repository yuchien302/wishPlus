class ChangeColumnNameOfWish < ActiveRecord::Migration
  def up
    rename_column :wishes, :user_uid, :useruid
  end

  def down
    rename_column :wishes, :useruid, :user_uid
  end
end
