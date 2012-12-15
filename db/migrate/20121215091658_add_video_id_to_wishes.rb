class AddVideoIdToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :videoId, :string
  end
end
