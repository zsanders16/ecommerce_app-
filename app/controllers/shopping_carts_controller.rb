class ShoppingCartsController < ApplicationController
  
  

  def index
    
  end

  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    @line_items = @shopping_cart.line_items

  end

  #custom methods

  #TODO: implement add additional items
  # def add_additional_item(line_item)
    
  # end
  
end
