class Size < ActiveRecord::Base
  attr_accessible :name
  
    has_many :prices, foreign_key: "size_id"
  
end
