class RestaurantTypesController < ApplicationController
  
  def index
    #@users = User.all
    @restaurant_types = RestaurantType.paginate(page: params[:page])
  end
  
  def show
    @restaurant_type = RestaurantType.find(params[:id])
  end
  
  def new
    @restaurant_type = RestaurantType.new
  end
  
  def create
    @restaurant_type = RestaurantType.new(params[:restaurant])
    if @restaurant_type.save
      # Handle a successful save.
      flash[:success] = "New restaurant type correctly added to the database"
      redirect_to @restaurant_type #This "redirect_to" method equals the user_path routing for the current user we are creating
    else  
      render 'new'
    end
  end
  
  def edit
    @restaurant_type = RestaurantType.find(params[:id]) 
  end
  
  def update
    if @restaurant_type.update_attributes(params[:restaurant_type]) 
      # Handle a successfull update
      flash[:success] = "Restaurant type correctly updated"
      redirect_to @restaurant_type
    else
      render 'edit'
    end 
  end
  
  def destroy
    @restaurant_type = RestaurantType.find(params[:id])
    
    @restaurant_type.destroy
    flash[:success] = "Restaurant type deleted"
    
    redirect_to restaurant_types_path
  end
  
  
end