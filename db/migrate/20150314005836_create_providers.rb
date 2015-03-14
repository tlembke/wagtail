class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :family_name
      t.string :given_names
      t.integer :organisation_id
      t.integer :user_id
      t.integer :craft_id
      t.string :phone
      t.timestamps null: false
    end
  end
end
