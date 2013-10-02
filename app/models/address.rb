class Address < ActiveRecord::Base
  attr_accessible :city, :country_address, :district, :postcode, :region, :street,
                  :latitude, :longitude, :main_address
                  
  belongs_to :user
  
end
