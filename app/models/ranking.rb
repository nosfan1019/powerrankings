class Ranking < ActiveRecord::Base
	attr_protected :admin

	belongs_to :source
	belongs_to :sport
	belongs_to :team

	validates :rank, :presence => true
	validates :team_id,  :presence => true
	validates :sport_id,  :presence => true
	validates :source_id,      :presence => true


end
