class AddAcceptedBooleanToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :accepted, :boolean, :default => false
  end
end
