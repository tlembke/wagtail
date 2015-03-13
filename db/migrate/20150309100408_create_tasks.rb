class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :goal_id,     :default => 0,  :null => false
      t.integer :person_id
      t.integer :team,     :default => ""
      t.integer :active,      :default => 1
      t.integer :parent,      :default => 0
      t.integer :task_type,     :default => 0

      t.timestamps null: false
    end
  end
end
