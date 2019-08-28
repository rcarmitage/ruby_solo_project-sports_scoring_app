require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/game.rb')
require_relative('../models/team.rb')
also_reload('../models/*')

get '/games' do
  @games = Game.all
  erb ( :"games/index" )
end

get '/games/new' do
  @team_a_id = Team.all
  erb(:"games/new")
end

post '/games' do
  game = Game.new(params)
  game.save
  redirect to("/games")
end

post '/games/:id/delete' do
  Game.delete(params[:id])
  redirect to("/games")
end
