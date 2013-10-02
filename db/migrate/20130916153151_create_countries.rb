class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code, :limit => 2
      t.string :name, :limit => 64

      t.timestamps
    end
  end
end
