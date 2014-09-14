class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :list_id, null: false
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
