class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
  end
end
