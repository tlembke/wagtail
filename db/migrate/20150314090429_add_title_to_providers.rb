class AddTitleToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :title, :string
  end
end
