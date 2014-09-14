class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :name ,     null: false
      t.integer :list_id,   null: false
      t.string  :description
      t.date    :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
