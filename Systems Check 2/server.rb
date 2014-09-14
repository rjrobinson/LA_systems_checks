require 'sinatra'
require "sinatra/reloader"
require 'pry'
require 'csv'


###############
##  DATA     ##
###############
game_data =[# game_data!
          { #game 1
          home_team: "Patriots",
          away_team: "Broncos",
          home_score: 7,
          away_score: 3
        },
        { #game2
          home_team: "Broncos",
          away_team: "Colts",
          home_score: 3,
          away_score: 0
        },
        { # game 3
          home_team: "Patriots",
          away_team: "Colts",
          home_score: 11,
          away_score: 7
        },
        { #game 4
          home_team: "Steelers",
          away_team: "Patriots",
          home_score: 7,
          away_score: 21
        }
]

leaderboard = [ "Patriots" => {wins: 0,
                              losses:0 },
                "Broncos" => {wins: 0,
                              losses:0 },
                "Colts" => {wins: 0,
                              losses:0 },
                "Steelers" => {wins: 0,
                              losses:0 },]

team_names = []

leaderboard[0].each do |team, scores|
  team_names << team
end


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

game_data.each do |game|
  winner = winner(game)
  loser = loser(game)
  leaderboard[0][winner][:wins]+=1
  leaderboard[0][loser][:losses]+=1
end


sorted = leaderboard[0].sort_by do |team, rank|
  -rank[:wins]
  rank[:losses]
end

team_symb = []

team_names.each do |name|
  team_symb << name.to_sym
end

###############
##  ROUTES   ##
###############



get '/' do
  @leaderboard = leaderboard
  @team_names = team_names

  erb :index
end


get '/leaderboard' do
  @leaderboard = leaderboard
  @sorted = sorted

  erb :leaderboards
end

get '/team/:team_symb' do
  @team_data = leaderboard[0].select{|team, scores| team == params[:team_symb]}

  erb :team
end
























