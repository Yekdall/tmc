class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :postcode
      t.string :region
      t.string :country
      t.string :phone
      t.string :fax
      t.integer :res_type
      t.string :email

      t.timestamps
    end
  end
end
