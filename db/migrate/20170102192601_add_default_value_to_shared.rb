class AddDefaultValueToShared < ActiveRecord::Migration
  def change
    change_column :students, :shared, :boolean, :default => false
  end
end
