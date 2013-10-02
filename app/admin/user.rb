ActiveAdmin.register User do
  
  index do
    column :email
    column :sign_in_count 
    column :current_sign_in_at
    column "Last connection", :last_sign_in_at
    column "User since", :created_at
    column "Last update", :updated_at
    column :superadmin
    default_actions
  end
  
  filter :email
  filter :superadmin
  filter :created_at
  filter :last_sign_in_at
  
  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
    end
    f.inputs "Addresses:" do
      f.has_many :addresses do |p|
        p.input :main_address#, :label => "Main address"
        p.input :street
        p.input :city
        p.input :postcode
        p.input :district
        p.input :region
        p.input :country_address, :label => "Country"
        p.input :phone_home, :label => "Home Phone"
        p.input :mobile
        #p.input :latitude, :disabled => true
        #p.input :longitude, :disabled => true
       end
    end 
    f.buttons
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    @user.superadmin = params[:user][:superadmin]
    @user.attributes = params[:user].delete_if do |k, v| 
      (k == "superadmin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end
