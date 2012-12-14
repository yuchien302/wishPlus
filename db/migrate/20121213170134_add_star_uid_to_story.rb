class AddStarUidToStory < ActiveRecord::Migration
  def change
    add_column :stories, :star_uid, :integer
  end
end
