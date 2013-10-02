class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :street
      t.string :city
      t.string :postcode
      t.string :district
      t.string :region
      t.string :country_address
      t.string :phone_home
      t.string :mobile
      t.float :latitude
      t.float :longitude
      t.boolean :main_address

      t.timestamps
    end
  end
end
