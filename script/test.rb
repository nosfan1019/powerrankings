# encoding: UTF-8
require 'rubygems'
require 'mechanize'
require 'open-uri'
require './config/environment'



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

@fdsa = Ranking.find_by_sql(sql)

@fdsa.each do |r|
	puts "#{r.sql_team} - #{r.sql_sport} - #{r.sql_rank}"
end