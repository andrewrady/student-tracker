class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :item_number
      t.string :category

      t.timestamps null: false
    end
  end
end
