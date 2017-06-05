class ShoppingCartsController < ApplicationController
  
  def index
    
  end

  def show
    @shopping_cart = current_user.current_shopping_cart
    @items = Item.where(shopping_carts_id: @shopping_cart.id )
  end
  

  
  
end
