class Address < ActiveRecord::Base
  attr_accessible :city, :country_address, :district, :postcode, :region, :street,
                  :latitude, :longitude, :main_address, :phone_home, :mobile
                  
  belongs_to :user
  
  def main_address?
    :main_address == true
  end
  
  
end
