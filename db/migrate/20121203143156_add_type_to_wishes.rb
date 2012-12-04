class AddTypeToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :type, :string
  end
end
