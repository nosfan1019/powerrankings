class AddScraperToSource < ActiveRecord::Migration
  def change
    add_column :sources, :scraper, :string
  end
end
