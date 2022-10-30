class AddBooleanToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :completed, :boolean, default: false
    remove_column :tasks, :email, :string
  end
end
