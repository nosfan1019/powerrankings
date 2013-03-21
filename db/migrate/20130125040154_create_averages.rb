class CreateAverages < ActiveRecord::Migration
  def change
    create_table :averages do |t|
      t.integer :average
      t.integer :team_id
      t.integer :sports_id

      t.timestamps
    end
  end
end
