class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :shopping_cart


  def current_shopping_cart
    self.shopping_cart ? self.shopping_cart : self.shopping_cart.create
  end
  
  
end
