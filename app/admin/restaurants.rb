ActiveAdmin.register Restaurant do
  
  index do
    column "Icon" do |icon|
      link_to(image_tag(icon.avatar.url(:thumb)), admin_restaurant_path(icon))
    end    
    column "Name", :name
    column "Type", :restaurant_type 
    column :address
    column :city
    column :postcode
    column :region
    column :pais
    column :phone
    column :fax
    column :email
    column :website
    column :latitude
    column :longitude
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Restaurant details" do
      f.input :name
      f.input :restaurant_type
      f.input :address
      f.input :city
      f.input :postcode
      f.input :region
      f.input :pais
      f.input :phone
      f.input :fax
      f.input :email
      f.input :website
      f.input :avatar, :as => :file
    end
    #f.inputs "Menu items" do
    #  f.has_many :prices do |p|
    #    p.input :price, :label => "Price (EUR)"
    #    p.input :size_id, :as => :select, :collection => Size.all
    #    p.input :product_id, :as => :select, :collection => Product.all
    #  end
    f.inputs "Distribution points" do
      f.has_many :distripos do |d|
        d.input :distri_type, :label => "Distribution type", as: :select, collection: ([["Postcode", "cp"], ["Distance", "km"]])
        d.input :postcode
        d.input :kmrange, :label => "Distance (in KM)"
      end
    end
    f.buttons
  end
  
  filter :name
  filter :res_type, :as => :select, :collection => proc { RestaurantType.all }, :label => "Restaurant type"
  filter :city
  filter :region
  filter :address
  filter :postcode   
  
  sidebar "Restaurant details", only: [:show, :edit] do
    attributes_table_for restaurant do
      row "Logo", :avatar do |icon|
        image_tag(icon.avatar.url(:thumb)) 
      end
      row :name
      row :restaurant_type 
      row :address
      row :city
      row :postcode
      row :region
      row :pais
      row :phone
      row :fax
      row :email
      row :website
      row :latitude
      row :longitude

    end
  end
  
  show do 
    panel "Distribution points" do
      table_for restaurant.distripos do
        column :distri_type
        column :postcode
        column :kmrange
      end
    end
    panel "Location" do
      @restaurant = Restaurant.find(params[:id])
      image_tag("http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{@restaurant.latitude}%2C#{@restaurant.longitude}")
    end
    
    active_admin_comments
  end
  
end
