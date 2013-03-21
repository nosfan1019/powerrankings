# encoding: UTF-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'

Team.delete_all

nfl_url = "http://espn.go.com/nfl/teams"
nfl = Nokogiri::HTML(open(nfl_url))

nfl.css('.bi').each do |item|
	Team.create!(:team => item.text, :sports_id => '1')
end



nba_url = "http://espn.go.com/nba/teams"
nba = Nokogiri::HTML(open(nba_url))

nba.css('.bi').each do |item|
	Team.create!(:team => item.text, :sports_id => '2')
end



mlb_url = "http://espn.go.com/mlb/teams"
mlb = Nokogiri::HTML(open(mlb_url))

mlb.css('.bi').each do |item|
	Team.create!(:team => item.text, :sports_id => '3')
end


nhl_url = "http://espn.go.com/nhl/teams"
nhl = Nokogiri::HTML(open(nhl_url))

nhl.css('.bi').each do |item|
	Team.create!(:team => item.text, :sports_id => '4')
end