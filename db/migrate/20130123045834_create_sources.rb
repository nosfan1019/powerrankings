class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :publisher
      t.text :url
      t.integer :sports_id
      t.string :scraper

      t.timestamps
    end
  end
end
