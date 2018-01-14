require 'nokogiri'
require 'open-uri'
require 'HTTParty'


#f = File.open("http://gd2.mlb.com/components/game/mlb/year_2017/month_04/day_25/scoreboard.xml")
#xml_doc  = Nokogiri::XML(f)

#puts xml_doc
page = HTTParty.get('http://gd2.mlb.com/components/game/mlb/year_2017/month_04/day_25/scoreboard.xml').to_s
parse_page = Nokogiri::XML(page)
puts parse_page.xpath("//game").attr("start_time")

#doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
#doc.css('h3.r > a.l').each do |node|
#  puts node.text
#end