class ShoppingCartsController < ApplicationController
  
  def index
    
  end

  def show

    @shopping_cart = current_user.current_shopping_cart
    @items = @shopping_cart.items


  end
  

  
  
end
