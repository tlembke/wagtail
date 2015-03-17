class CreateTeamJoinTable < ActiveRecord::Migration
  create_join_table :people, :providers, table_name: :team do |t|
  	t.date :last_appt
  	t.date :next_appt
  	t.integer :confirmed
  end
end
