

class CategoriesController < ApplicationController
  before_action :set_category, except: [:index, :new, :create]
#it will run before_action (set_categories) method for the show and edit.
  def index
    # Scope the categories down to the user that is logged in
    @categories = Category.paginate(page: params[:page], per_page: 9)
  end


  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      # flash[:notice] = 'Category Created!'
      redirect_to categories_path, notice: 'Category Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # our before action is doing this for us
    # @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy

    # our before action is doing this for us
    # @category = Category.find(params[:id])
    @category.destroy
    
    # long hand way of setting flash messages
    flash[:notice] = 'Category Deleted!'
    redirect_to categories_path
  end

  private
    # Strong Params
    def category_params
      params.require(:category).permit(:name)
                                     #db migrate
    end

    # Before Action
    def set_category
      @category = Category.find(params[:id])
    end


end
