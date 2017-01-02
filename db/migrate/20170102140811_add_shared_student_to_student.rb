class AddSharedStudentToStudent < ActiveRecord::Migration
  def change
    add_column :students, :shared, :boolean
  end
end
