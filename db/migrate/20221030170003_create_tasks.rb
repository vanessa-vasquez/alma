class CreateTasks < ActiveRecord::Migration
  def change
    create_table "tasks", force: :cascade do |t|
      t.string   "name"
      t.string    "email"
      t.float     "hours"
      t.datetime  "deadline"
      t.string    "location"
      t.integer   "price"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
