class AverageController < ApplicationController
	def index
	  	@averages = Average.avg
		@averages = @averages.sort_by { |k,v| v }

	  	# @weight = Average.weight

	  	# @football = Average.avg.football
	end

	# def weighted
	# 	# numTeams = Hash.new
	# 	# Team.all(:group => 'sports_id').count

	# 	# @numTeams = Team.count(:all, :group => 'sports_id')

	# 	# @weighted = Ranking.all
	# 	# @weighted.each do |row|
	# 	# 	denom = @numTeams[row.sport_id.to_i] 
	# 	# 	math = row.rank.to_i
	# 	# 	math = math / denom.to_f
	# 	# 	row.rank = math

	# 	# 	@ryan = Source.find(1).publisher
	# 	# end

	# 	# @weighted = Ranking.group(:team_id)
	# 	# @weighted = @weighted.sort_by{|e| e[:rank].to_i}
	# end

	def weighted
		sql = '
		SELECT 	t.team as sql_team, 
				s.sport as sql_sport, 
				ROUND((SUM(r.rank)/COUNT(r.team_id))/c.totalCount,4) as sql_rank
		FROM rankings r
		INNER JOIN teams t on t.id = r.team_id
		INNER JOIN sports s on s.id = r.sport_id
		INNER JOIN 
			(
				SELECT id, sport_id, COUNT(*) totalCount
				FROM teams
				GROUP BY sport_id	
			) c on t.sport_id = c.sport_id
		GROUP BY team_id
		ORDER BY 3
		'
		@weighted = Ranking.find_by_sql(sql)


	end
end
