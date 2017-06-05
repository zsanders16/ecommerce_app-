class ShoppingCartsController < ApplicationController
  
  def index
    
  end

  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    @items = @shopping_cart.items

  end
  

  
  
end
