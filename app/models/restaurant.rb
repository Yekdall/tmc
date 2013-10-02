class Restaurant < ActiveRecord::Base
  attr_accessible :address, :city, :pais, :email, :fax, :name, :phone, :postcode, :region_id, :res_type, :website, :avatar, :prices_attributes
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :micro => "60x60>" }, :default_url => "/images/gator.png",
                             :url  => "/assets/restaurants/:id/:style/:basename.:extension",
                             :path => ":rails_root/public/assets/restaurants/:id/:style/:basename.:extension"
  
  has_many :prices
  has_many :products, :through => :prices
  
  belongs_to :restaurant_type, foreign_key: "res_type"
  
  belongs_to :region, foreign_key: "region_id"
  
  accepts_nested_attributes_for :prices
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    [address, postcode, city].compact.join(', ')
  end
  
   
end
