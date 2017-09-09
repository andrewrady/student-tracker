class CreateHeadOfHouses < ActiveRecord::Migration
  def change
    create_table :head_of_houses do |t|
      t.string :name
      t.references :student, index: true
      t.float :amount

      t.timestamps null: false
    end
    add_foreign_key :head_of_houses, :students
  end
end
