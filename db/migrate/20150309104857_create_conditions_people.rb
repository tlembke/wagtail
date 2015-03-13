class CreateConditionsPeople < ActiveRecord::Migration
  def change
    create_table :conditions_people, :id => false do |t|
  	t.references :condition, :null => false
  	t.references :person, :null => false

    end
  end
end
