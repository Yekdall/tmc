ActiveAdmin.register Distripo do

  index do
    column :restaurant
    column "Distribution type", :distri_type
    column :postcode
    column "Distance range (in KM)", :kmrange
    default_actions
  end
  
  form do |f|
    f.inputs "New distribution point" do
      f.input :restaurant
      f.input :distri_type, :label => "Distribution type", as: :select, collection: ([["Postcode", "cp"], ["Distance", "km"]]), :include_blank => false
      f.input :postcode
      f.input :kmrange, :label => "Distance (in KM)"
    end
    f.buttons
  end
  
  filter :restaurant
  
  
end