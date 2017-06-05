require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_user_shopping_cart


  #@shopping_cart = ShoppingCart.find_by(user_id: current_user.id)


  private 

    def set_user_shopping_cart
      if user_signed_in?
        @shopping_cart = current_user.current_shopping_cart
        @shopping_cart
      end
      
    end
    
end
