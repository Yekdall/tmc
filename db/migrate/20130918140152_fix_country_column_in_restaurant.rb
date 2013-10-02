class FixCountryColumnInRestaurant < ActiveRecord::Migration
  def up
    rename_column :restaurants, :country, :pais
  end

  def down
  end
end
