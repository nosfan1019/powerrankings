# encoding: UTF-8
require 'rubygems'
require 'mechanize'
require 'open-uri'
require './config/environment'



Ranking.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE rankings")

src = Source.find(1)
url = src.url
sportsid = src.sports_id



# Normal teams still in existence
hash = Hash.new
Team.where(:sports_id => sportsid).each do |t|
  	hash.store(t.id,t.team)
end
# Relocated teams
old_hash = Hash.new
Relocate.find(:all).each do |t|
	old_hash.store(t.team_id,t.name)
end


agent = Mechanize.new
link = "http://espn.go.com/nba/powerrankings/_/year/"
year = 2004

loop do |y|
	url = [link,year].join('')
	page = agent.get(url)
	
	date = page.search('.date').text
	date = date.gsub(/Updated:\s/,'')
	date = DateTime.parse(date)

	week = page.search('form.js-goto:nth-child(1) .tablesm option[@selected="selected"]').text.to_i

	loop do |w|
		url = [link,year,'/week/',week].join('')
		page = agent.get(url)

		# Breaks for missing ranking in early 2005
		if page.uri.to_s != url
			break
		end

		i = 0 
		page.search('.tablehead tr:nth-child(n+3)').each do |item|

			rank = item.css('.pr-rank').text
			city = item.css('td div a').text

			team = item.css('td:nth-child(2) > a').map { |link| link['href'] }.to_s
			team = team.scan(/name\/[a-z]{2,4}\/(.*)\"/).to_s
			team = team.gsub(/-/,' ')
			team = team.gsub(/\[\[\"/,'')
			team = team.gsub(/\"\]\]/,'')
			team = team.to_s

			# Normal teams still in existence
			if hash.values.select {|v| v.downcase.include? team}.any?  
				hash.select do |k,v|
					if v.downcase.include? team
						Ranking.create!(:rank => rank, :team_id => k, :sport_id => sportsid, :source_id => src.id, :week => week, :date => date)
						# puts [rank, k, v].join(' ')
					end
				end
			# Relocated teams
			else 
				team = item.css('td div:nth-child(2)').text 
				team = team.gsub(/(\-|[0-9])/,'')
				team = team.downcase.to_s

				old_hash.select do |k,v|
					if v.downcase.include? team
						Ranking.create!(:rank => rank, :team_id => k, :sport_id => sportsid, :source_id => src.id, :week => week, :date => date)
						# puts [rank, k, v, @name].join(' ')
					end
				end
			end

			i += 1
			break if i > 29
		end




		headline = page.search('.h2').text	
		date = page.search('.date').inner_text


		puts [week, ' - ', headline, ' - ', date].join('')


		week -= 1
		break if week <= 0
	end


	year += 1
	break if year >= 2013
end















