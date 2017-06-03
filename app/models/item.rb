class Item < ApplicationRecord
  belongs_to :category
  belongs_to :shopping_cart, optional: true
end
