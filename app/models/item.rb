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
  has_many :line_items 
  before_destroy


  private

    def ensure_not_refernce_by_any_line_item
      unless line_item.empty?
          errors.add(:base, 'Line item present')
          throw :abort
      end
    end
end
