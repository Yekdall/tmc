class AddAttachmentAvatarToRestaurantTypes < ActiveRecord::Migration
  def self.up
    change_table :restaurant_types do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :restaurant_types, :avatar
  end
end
