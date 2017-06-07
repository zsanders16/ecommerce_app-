# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  name             :string
#  price            :float
#  description      :text
#  category_id      :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :category
  belongs_to :shopping_cart, optional: true
end
