class ItemsController < ApplicationController
  #before_action :set_item, except: [:index, :new, :create]

  def index
    @category = Category.find(params[:category_id])
    @items = @category.items
  end

  def show
    @shopping_cart = current_user.current_shopping_cart
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])

  end

  def new
<<<<<<< HEAD
    @category = Category.find(params[:category_id])
=======
    @category = Category.new(params[:category_id])
>>>>>>> 55aef96a15f88456d8df57d4fc2d8c041b4839d5
    @item = @category.items.new
  end

  def create
    @item = category.items(item_params)
    if @item.save
      redirect_to @item, notice: 'Item Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item Successfully Edited!'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item Successfully Deleted.'
  end

  #custom routes


  def add_item
   
    @item = Item.find(params[:item_id])
    @item.shopping_carts_id = params[:shopping_cart_id]
<<<<<<< HEAD

    redirect_to shopping_cart_paths(:shopping_cart_id)

=======
    @item.save
    binding.pry
    
    redirect_to shopping_cart_path(:shopping_cart_id)
    
>>>>>>> 55aef96a15f88456d8df57d4fc2d8c041b4839d5
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end

  def set_item
    @item = category.items(params[:id])
  end
end
