class AddStartAndEndDatesToContracts < ActiveRecord::Migration
  def change
    add_column :head_of_houses, :start_date, :datetime
    add_column :head_of_houses, :end_date, :datetime
  end
end
