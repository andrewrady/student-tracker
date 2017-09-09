class CangeUserToHeadOfHouse < ActiveRecord::Migration
  def change
    rename_column :students, :head_of_houses_id, :head_of_house_id
  end
end
