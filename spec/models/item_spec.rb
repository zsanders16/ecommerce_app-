require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should belong_to(:category) }
  end

  describe '.return_ordered_items_by_name' do
    it 'return list of items by name asc' do
      category = Category.create(name: 'test')
      item1 = category.items.create(name: 'aitem1', price: 10.00 )
      item2 = category.items.create(name: 'zitem2', price: 15.00 )

      expect(category.items.return_ordered_items_by_name.first).to eq(item1)
      expect(category.items.return_ordered_items_by_name.last).to eq(item2)
    end
  end

  describe '.return_ordered_items_by_price' do
    it 'return list of items by price asc' do
      category = Category.create(name: 'test')
      item1 = category.items.create(name: 'aitem1', price: 10.00 )
      item2 = category.items.create(name: 'zitem2', price: 15.00 )

      expect(category.items.return_ordered_items_by_price.first).to eq(item1)
      expect(category.items.return_ordered_items_by_price.last).to eq(item2)
    end
  end

  describe '.return_ordered_items_by_price' do
    it 'return list of items by price desc' do
      category = Category.create(name: 'test')
      item1 = category.items.create(name: 'aitem1', price: 10.00 )
      item2 = category.items.create(name: 'zitem2', price: 15.00 )

      expect(category.items.return_ordered_items_by_price(false).first).to eq(item2)
      expect(category.items.return_ordered_items_by_price(false).last).to eq(item1)
    end
  end

end
