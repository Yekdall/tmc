class Distripo < ActiveRecord::Base
  attr_accessible :distri_type, :kmrange, :postcode, :restaurant_id, :as => [:default, :admin]
  
  belongs_to :restaurant
  
  validates :distri_type, presence: true
  validates :restaurant_id, presence: true
  validates :postcode, presence: true, if: :postcode_type?
  validates :kmrange, presence: true, if: :distance_type?
  
  
  def postcode_type?
    :distri_type == "cp"
  end
  
  def distance_type?
    :distri_type == "km"
  end
  
end
