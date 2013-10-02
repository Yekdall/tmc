class Region < ActiveRecord::Base
  attr_accessible :name
  
  has_many :restaurants, foreign_key: "region_id"
  
end
