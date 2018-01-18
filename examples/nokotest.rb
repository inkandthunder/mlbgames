#require 'nokogiri'
#require 'open-uri'
#require 'HTTParty'

$: << File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'mlbgames'

#f = File.open("http://gd2.mlb.com/components/game/mlb/year_2017/month_04/day_25/scoreboard.xml")
#xml_doc  = Nokogiri::XML(f)

#puts xml_doc
page = HTTParty.get('http://gd2.mlb.com/components/game/mlb/year_2017/month_04/day_25/scoreboard.xml').to_s
@parse_page = Nokogiri::XML(page)
doc = Nokogiri::Slop(page)
#root = parse_page.root
#puts parse_page.xpath("//game").attr("start_time")
#puts parse_page.xpath("//*[@start_time]").attr("start_time")
#puts parse_page.xpath("//w_pitcher")
#puts doc.scoreboard.go_game.first.w_pitcher.pitcher["name"]
doc.scoreboard.go_game.each do |event|
    puts "Game ID: " + event.game["id"] 
    #puts event.team["name"] #+ ": " + event.team.gameteam["R"]
    puts ""
end


game = Mlbgames::Base.find_all_games_by_team('BOS').first


#doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
#doc.css('h3.r > a.l').each do |node|
#  puts node.text
#end