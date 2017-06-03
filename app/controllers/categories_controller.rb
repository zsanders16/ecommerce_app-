class CategoriesController < ApplicationController
  before_action :set_categories, except: [:index, :new, :create]
#it will run before_action (set_categories) method for the show and edit.
  def index
    # Scope the categories down to the user that is logged in
    @categories = current_user.categories
  end

  def show
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      # flash[:notice] = 'Category Created!'
      redirect_to @category, notice: 'Category Created!'
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
      redirect_to @category
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
    redirect_to category_path
  end

  private
    # Strong Params
    def category_params
      params.require(:category).permit(:name)
                                     #db migrate
    end

    # Before Action
    def set_category
      @category = current_user.categories.find(params[:id])
    end
end
