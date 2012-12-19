class AddPidToWish < ActiveRecord::Migration
  def change
    add_column :wishes, :pid, :integer
  end
end
