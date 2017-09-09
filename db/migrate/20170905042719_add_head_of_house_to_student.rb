class AddHeadOfHouseToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :head_of_houses, index: true
    add_foreign_key :students, :head_of_houses
  end
end
