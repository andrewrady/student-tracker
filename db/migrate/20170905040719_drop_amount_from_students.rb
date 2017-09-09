class DropAmountFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :amount
    remove_column :students, :shared
  end
end
