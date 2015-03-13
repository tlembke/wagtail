class CreateMeasurevalues < ActiveRecord::Migration
  def change
    create_table :measurevalues do |t|
      t.integer :person_id
      t.integer :measure_id
      t.decimal :value,      :precision => 8, :scale => 2
      t.date :value_date
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
