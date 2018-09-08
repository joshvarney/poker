require 'sinatra'
require_relative 'poker.rb'

get '/' do
	erb :poker, locals:{game: [""]}
end
post '/play_game' do
	game = The_game.new
	game = game.everything
	erb :poker, locals:{game: game}
end