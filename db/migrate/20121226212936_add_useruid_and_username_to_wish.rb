class AddUseruidAndUsernameToWish < ActiveRecord::Migration
  def change
    add_column :wishes, :user_uid, :string
    add_column :wishes, :username, :string
  end
end
