class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :address_line
      t.string :address_line_2
      t.string :town
      t.string :state
      t.string :postcode
      t.string :phone

      t.timestamps null: false
    end
  end
end
