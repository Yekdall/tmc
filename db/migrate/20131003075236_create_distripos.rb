class CreateDistripos < ActiveRecord::Migration
  def change
    create_table :distripos do |t|
      t.integer :restaurant_id
      t.string :distri_type
      t.string :postcode
      t.decimal :kmrange

      t.timestamps
    end
  end
end
