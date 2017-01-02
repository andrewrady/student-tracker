class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :price
      t.integer :item_number
      t.references :student, index: true

      t.timestamps null: true
    end
    add_foreign_key :transactions, :students
  end
end
