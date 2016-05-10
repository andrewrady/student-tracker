class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :status
      t.string :rank
      t.integer :size
      t.integer :amount

      t.timestamps null: false
    end
  end
end
