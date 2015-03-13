class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :family_name
      t.string :given_names
      t.string :known_as
      t.string :address_line
      t.string :address_line_2
      t.string :town
      t.string :state
      t.string :postcode
      t.integer :sex
      t.date :dob
      t.string :ihi
      t.string :dva
      t.string :phone
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
