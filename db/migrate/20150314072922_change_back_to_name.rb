class ChangeBackToName < ActiveRecord::Migration
    change_table :organisations do |t|
  		t.rename :orgname, :name
	end
end
