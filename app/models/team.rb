class Team < ActiveRecord::Base
	attr_protected :admin

	has_many :rankings
	belongs_to :sports

	validates :sport_id, :presence => true
	validates :team, :presence => true



end
