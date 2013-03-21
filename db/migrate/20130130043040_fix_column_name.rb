class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :sources, :sports_id, :sport_id
    rename_column :averages, :sports_id, :sport_id
    rename_column :teams, :sports_id, :sport_id
  end
end
