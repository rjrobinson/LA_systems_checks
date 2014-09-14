require 'sinatra'
require 'pry'
require 'csv'


###############
##   DATA    ##
###############
site_data = []
CSV_FILE = "game_data.csv"

def csv_import(filename)
  results = []
  CSV.foreach(filename, headers: true,header_converters: :symbol ) do |row|
    results << row.to_hash
  end
  results
end


leaderboard = ["Patriots" => {wins: 0,
                              losses:0 },
                "Broncos" => {wins: 0,
                              losses:0 },
                "Colts" => {  wins: 0,
                              losses:0 },
                "Steelers" => {wins: 0,
                              losses:0 }]



######################
##   SITE METHODS   ##
######################


def winner(game_data)
  winner = ''
  if game_data[:home_score] > game_data[:away_score]
    winner = game_data[:home_team]
  else
    winner = game_data[:away_team]
  end
end

def loser(game_data)
  loser = ''
  if game_data[:home_score] > game_data[:away_score]
    loser = game_data[:away_team]
  else
    loser = game_data[:home_team]
  end
end

site_data = csv_import(CSV_FILE)


site_data.each do |game|
  winner = winner(game)
  loser = loser(game)
  leaderboard[0][winner][:wins]+=1
  leaderboard[0][loser][:losses]+=1
end

sorted = leaderboard[0].sort_by do |team, rank|
  -rank[:wins]
end


binding.pry









site_data = csv_import(CSV_FILE)
binding.pry
