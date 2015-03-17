class RenameTeamToTeams < ActiveRecord::Migration
  def change
  	rename_table :team, :teams
  end
end
