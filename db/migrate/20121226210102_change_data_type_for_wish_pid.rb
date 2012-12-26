class ChangeDataTypeForWishPid < ActiveRecord::Migration
  def up
    change_table :wishes do |t|
      t.change :pid, :string
    end
  end

  def down
    change_table :wishes do |t|
      t.change :pid, :integer
    end
  end
end
