class AddUserToHeadOfHosue < ActiveRecord::Migration
  def change
    add_reference :head_of_houses, :user, index: true
    add_foreign_key :head_of_houses, :users
  end
end
