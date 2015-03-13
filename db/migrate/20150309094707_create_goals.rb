class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.integer :condition_id , :default => 0,  :null => false
      t.integer :patient_id,      :default => ""
      t.integer :team_id, :default => ""
      t.integer :measure_id
      t.integer :active
      t.integer :parent
      t.timestamps null: false
    end
  end
end
