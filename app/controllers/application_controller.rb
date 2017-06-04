require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  #@shopping_cart = ShoppingCart.find_by(user_id: current_user.id)
end
