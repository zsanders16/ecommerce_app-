# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
end
