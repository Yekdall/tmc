class Country < ActiveRecord::Base
  attr_accessible :code, :name
  
  #has_many :restaurants, :foreign_key => :pais, :primary_key => :code

  
end
