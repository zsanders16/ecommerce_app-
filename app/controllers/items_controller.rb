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
    @category = Category.find(params[:category_id])
    @item = @category.items.new
  end

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(item_params)
    if @item.save
      redirect_to category_item_path(@category, @item), notice: 'Item Created!'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    if @item.update(item_params)
      redirect_to category_item_path(@category, @item), notice: 'Item Successfully Edited!'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    item = @category.items.find(params[:id])
    item.destroy
    redirect_to category_items_path, notice: 'Item Successfully Deleted.'
  end

  #custom routes


  def add_item

    @item = Item.find(params[:item_id])
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @shopping_cart.items << @item

    redirect_to shopping_cart_path(@shopping_cart)

  end

  def remove_item
    @shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
    @shopping_cart.items.find(params[:item_id]).destroy

    redirect_to shopping_cart_path(@shopping_cart)

  end
  

  private

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end

  def set_item
    @item = @category.items(params[:id])
  end
end
