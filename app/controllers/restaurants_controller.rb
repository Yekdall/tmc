class RestaurantsController < ApplicationController
  
  def index
    #@users = User.all
    @restaurants = Restaurant.paginate(page: params[:page])
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @selected_type = RestaurantType.find(@restaurant.res_type)
    @selected_region = Region.find(@restaurant.region)
  end
  
  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      # Handle a successful save.
      flash[:success] = "New restaurant correctly added to the database"
      redirect_to @restaurant #This "redirect_to" method equals the user_path routing for the current user we are creating
    else  
      render 'new'
    end
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id]) 
  end
  
  def update
    if @restaurant.update_attributes(params[:restaurant]) 
      # Handle a successfull update
      flash[:success] = "Restaurant profile correctly updated"
      redirect_to @restaurant
    else
      render 'edit'
    end 
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:id])
    
    @restaurant.destroy
    flash[:success] = "Restaurant deleted"
    
    redirect_to restaurants_path
  end
  
  
end