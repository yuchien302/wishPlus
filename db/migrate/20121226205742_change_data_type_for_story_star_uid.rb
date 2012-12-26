class ChangeDataTypeForStoryStarUid < ActiveRecord::Migration
  def up
    change_table :stories do |t|
      t.change :star_uid, :string
    end
  end

  def down
    change_table :stories do |t|
      t.change :star_uid, :integer
    end
  end
end
