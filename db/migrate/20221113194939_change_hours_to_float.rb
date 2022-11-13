class ChangeHoursToFloat < ActiveRecord::Migration
  def change
    change_column :tasks, :hours, :float
  end
end
