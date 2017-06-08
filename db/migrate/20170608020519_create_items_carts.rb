class CreateItemsCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :items_carts do |t|
      t.belongs_to :Item, foreign_key: true
      t.belongs_to :ShoppingCart, foreign_key: true

      t.timestamps
    end
  end
end
