class ShoppingCartsController < ApplicationController
  
  def index
    
  end

  def show
    #@shopping_cart = Shopping_Cart.find_by(user_id: current_user.id)
    @category = Category.find(params[:id])
    @items = @category.items
  end
  

  def change_item_amount
  end
  
  def remove_item
  end
  
  def add_item
  end
  
end
