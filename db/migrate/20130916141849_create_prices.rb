class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.integer :restaurant_id
      t.integer :size
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
