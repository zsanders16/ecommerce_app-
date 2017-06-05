class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.belongs_to :category, foreign_key: true
      t.belongs_to :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
