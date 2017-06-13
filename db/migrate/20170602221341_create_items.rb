class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.text :description
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
