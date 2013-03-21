class AverageController < ApplicationController
	def index
	  	@averages = Average.avg
		@averages = @averages.sort_by { |k,v| v }

	end

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

	def sortable
		@weighted = 'Ryan'
		@team = Team.all

		respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @team }
	    end

	end

end
