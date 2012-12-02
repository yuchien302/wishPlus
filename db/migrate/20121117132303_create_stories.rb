class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
