class RestaurantType < ActiveRecord::Base
  attr_accessible :name, :avatar
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :micro => "60x60>" }, :default_url => "/images/gator.png",
                             :url  => "/assets/restaurant_types/:id/:style/:basename.:extension",
                             :path => ":rails_root/public/assets/restaurant_types/:id/:style/:basename.:extension"
  
  has_many :restaurants, foreign_key: "res_type"
  
end
