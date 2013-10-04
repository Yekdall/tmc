class ProductsController < ApplicationController
  
  def index
    #@products = Product.paginate(page: params[:page])
    @search = Product.search(params[:q])
    @products = @search.result(distinct: true).paginate(page: params[:page])
    
  end
  
  def show
    @product = Product.find(params[:id])
    
    peq = 1
    med = 2
    gra = 3
    na = 4
    
    @prices = @product.prices.paginate(page: params[:page]).order(:price)
    @prices_peq = @product.prices.paginate(page: params[:page]).order(:price).where(:size_id => peq)
    @prices_med = @product.prices.paginate(page: params[:page]).order(:price).where(:size_id => med)
    @prices_gra = @product.prices.paginate(page: params[:page]).order(:price).where(:size_id => gra)
    
  end
  
  
end