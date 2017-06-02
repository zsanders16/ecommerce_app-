class ShoppingCart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :item, optional: true
end
