class AddPhotoToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :photo, :string
  end
end
