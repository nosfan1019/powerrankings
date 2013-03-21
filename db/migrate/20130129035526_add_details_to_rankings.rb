class AddDetailsToRankings < ActiveRecord::Migration
  def change
    add_column :rankings, :week, :integer
    add_column :rankings, :date, :datetime
  end
end
