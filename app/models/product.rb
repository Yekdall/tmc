class Product < ActiveRecord::Base
  attr_accessible :description, :name, :product_type, :avatar, :prices_attributes
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :micro => "60x60>" }, :default_url => "/images/gator.png",
                             :url  => "/assets/products/:id/:style/:basename.:extension",
                             :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  
  has_many :menus
  has_many :restaurants, through: :menus
  
  has_many :prices, dependent: :destroy
  has_many :restaurants, through: :prices
  
  accepts_nested_attributes_for :prices
  
  has_many :sizes, through: :prices
  
end
