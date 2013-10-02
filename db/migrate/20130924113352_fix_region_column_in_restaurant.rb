class FixRegionColumnInRestaurant < ActiveRecord::Migration
  def up
    rename_column :restaurants, :region, :region_id
  end

  def down
  end
end
