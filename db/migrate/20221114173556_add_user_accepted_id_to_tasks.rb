class AddUserAcceptedIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_accepted_id, :integer
    add_index :tasks, :user_accepted_id
  end
end
