class ShoppingCartsController < ApplicationController
  
  def index
    
  end

  def show
    @shopping_cart = current_user.current_shopping_cart
    @category = Category.find(params[:id])
    @items = @category.items
  end
  

  
  
end
