class RemoveStudentId < ActiveRecord::Migration
  def change
    remove_column :head_of_houses, :student_id
  end
end
