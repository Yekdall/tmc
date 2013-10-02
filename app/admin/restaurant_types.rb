ActiveAdmin.register RestaurantType do
  
  index do
    column "Icon" do |icon|
      link_to(image_tag(icon.avatar.url(:thumb)), admin_restaurant_type_path(icon))
    end    
    column "Restaurant type", :name
    default_actions
  end
  
  
    
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :avatar, :as => :file
    end
    f.buttons
  end
  
  filter :name
  
end
