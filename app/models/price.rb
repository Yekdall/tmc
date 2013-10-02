class Price < ActiveRecord::Base
  attr_accessible :price, :size_id, :product_id, :restaurant_id, :as => [:default, :admin]
    
  validates :product_id, presence: true
  validates :restaurant_id, presence: true
  
  belongs_to :restaurant
  belongs_to :product
  belongs_to :size
  
  
end
