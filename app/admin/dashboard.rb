#ActiveAdmin.register_page "Dashboard" do

#  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

#  content :title => proc{ I18n.t("active_admin.dashboard") } do
  #  div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #    span :class => "blank_slate" do
  #      span I18n.t("active_admin.dashboard_welcome.welcome")
  #      small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #    end
  #  end
ActiveAdmin::Dashboards.build do
  
   
  section "Recently added products" do
    table_for Product.order("created_at asc").limit(5) do
      column :name do |product|
        link_to product.name, admin_product_path(product)
      end
      column :description
      column :product_type
    end
    strong { link_to "View All Products", admin_products_path }
  end
    
  section "Recently added restaurants" do
    table_for Restaurant.order("created_at asc").limit(5) do
      column :name do |restaurant|
        link_to restaurant.name, admin_restaurant_path(restaurant)
      end
      column :city
      column "Restaurant Type", :res_type
    end
    strong { link_to "View All Restaurants", admin_restaurants_path }
  end
  
 
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
#  end # content
end
