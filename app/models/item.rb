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
  
  validates_presence_of :name, :price
  

  def self.return_ordered_items_by_name
    order(:name)
  end

  def self.return_ordered_items_by_price(lowest = true)
    lowest ? order(:price) : order(price: :desc)
  end
  
  
end
