class CreateRelocates < ActiveRecord::Migration
  def change
    create_table :relocates do |t|
      t.string :name
      t.integer :team_id

      t.timestamps
    end
  end
end
