class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.string :rank
      t.integer :team_id
      t.integer :sport_id
      t.integer :source_id

      t.timestamps
    end
  end
end
