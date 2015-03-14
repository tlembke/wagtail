class RenameNameInOrganisation < ActiveRecord::Migration
  change_table :organisations do |t|
  		t.rename :name, :orgname
end
end
