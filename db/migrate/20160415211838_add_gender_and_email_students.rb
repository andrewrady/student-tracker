class AddGenderAndEmailStudents < ActiveRecord::Migration
  def change
  	add_column :students, :gender, :string
  	add_column :students, :email, :string
  end
end
