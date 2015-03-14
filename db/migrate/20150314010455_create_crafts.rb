class CreateCrafts < ActiveRecord::Migration
  def change
    create_table :crafts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
