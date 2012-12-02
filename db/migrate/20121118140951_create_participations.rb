class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :story
      t.references :user

      t.timestamps
    end
    add_index :participations, :story_id
    add_index :participations, :user_id
    add_index :participations, [:story_id, :user_id], :unique => true
  end
end
