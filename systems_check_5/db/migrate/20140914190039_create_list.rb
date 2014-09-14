class CreateList < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
