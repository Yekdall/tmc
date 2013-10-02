ActiveAdmin.register Price do
  
  index do
    column :restaurant
    column :product
    column :size
    column :price
    default_actions
  end
  
end
