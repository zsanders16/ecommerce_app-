class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :shopping_cart

  def current_shopping_cart

    if ShoppingCart.find_by(user_id: self.id).nil?
      ShoppingCart.create(user_id: self.id)
    else
      ShoppingCart.find_by(user_id: self.id)
    end
  end
  
end
