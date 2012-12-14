class AddStarIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :star_id, :integer
  end
end
