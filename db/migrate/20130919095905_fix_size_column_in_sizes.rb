class FixSizeColumnInSizes < ActiveRecord::Migration
  def up
    rename_column :prices, :size, :size_id
  end

  def down
  end
end
