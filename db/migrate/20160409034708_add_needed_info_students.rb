class AddNeededInfoStudents < ActiveRecord::Migration
  def change
  	add_column :students, :phone, :string
  	add_column :students, :trail, :string
  	add_column :students, :age, :integer
  end
end
