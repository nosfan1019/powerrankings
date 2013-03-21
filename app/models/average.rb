class Average < ActiveRecord::Base
  	attr_protected :admin

	has_many :rankings
	has_many :teams, :through => :rankings

	def self.avg
		# Team.where(:sports_id => 1)
		# Ranking.select('team_id, AVG(rank)').group(:team_id)
		# scope :blah, includes(:rankings).group('team_id').order('AVG(rankings.rank) DESC')

		Ranking.average(:rank, :group => 'team_id')
		


	end

	def self.weight
		# Team.count(:group => 'sports_id')
		# @sum = Ranking.sum(:rank, :group => 'team_id')		
		# Ranking.first(100)

		# Ranking.sum(:rank, :group => 'team_id')

	end





end
