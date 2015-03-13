class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.string :abbreviation
      t.text :description
      t.string :units
      t.decimal :value,        :precision => 8, :scale => 2
      t.integer :operator
      t.integer :places, :default => 0, :null => false

      t.timestamps null: false
    end
  end
end
