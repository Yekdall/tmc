ActiveAdmin.register Product do
  index do
    column "Icon" do |icon|
      link_to(image_tag(icon.avatar.url(:thumb)), admin_product_path(icon))
    end    
    column :name
    column :description
    column :product_type
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Product details" do
      f.input :name
      f.input :description
      f.input :product_type
      f.input :avatar, :as => :file
    end
    f.inputs "Available in:" do
      f.has_many :prices do |p|
        p.input :restaurant
        p.input :price, :label => "Price (EUR)"
        p.input :size
      end
    end
    f.buttons
  end
  
  filter :name
  filter :product_type
  
  sidebar "Product details", only: [:show, :edit] do
    attributes_table_for product do
      row "Logo", :avatar do |icon|
        image_tag(icon.avatar.url(:thumb)) 
      end
      row :product_type
      row :name
      row :description
    end
  end
  
  show do 
    panel "Available in:" do
      table_for product.prices do
        column :restaurant
        column :size
        column :price
      end
    end
    active_admin_comments
  end
  
end
