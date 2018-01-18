class Mlbgames::Base
end

def self.find_all_games_by_team(team, date = Date.today)
    games = []
    game_xml = client.load('miniscoreboard.xml', date)
    game_xml.xpath("/games/game[@away_name_abbrev='#{team}'] | /games/game[@home_name_abbrev='#{team}']").each do |game|
      games << MLBAPI::Game.new(game.attributes)
    end
    games
end