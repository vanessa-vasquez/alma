class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string, default: '', null: false
    add_column :users, :lname, :string, default: '', null: false
    add_column :users, :school, :string, default: '', null: false
  end
end
