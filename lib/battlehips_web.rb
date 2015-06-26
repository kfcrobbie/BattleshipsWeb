require 'sinatra/base'
require 'battleships'
require_relative 'random_coordinates'


class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  set :views, proc { File.join(root, '..','views') }

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/player/:player' do |player|
    erb :get_name, locals: {player: player}
  end


  get '/place/:player' do |player|
    $game = Game.new Player, Board
    erb "newgame_#{player}".to_sym
  end

   get '/player1_board' do
    $game.player_1.place_ship Ship.submarine, params[:coordinates1], params[:orientation1]
    $game.player_1.place_ship Ship.destroyer, params[:coordinates2], params[:orientation2]
    $game.player_1.place_ship Ship.cruiser, params[:coordinates3], params[:orientation3]
    $game.player_1.place_ship Ship.battleship, params[:coordinates4], params[:orientation4]
    $game.player_1.place_ship Ship.aircraft_carrier, params[:coordinates5], params[:orientation5]
    erb :placed_ships1
  end



   get '/player2_board' do
    $game.player_2.place_ship Ship.submarine, params[:coordinates2_1], params[:orientation2_1]
    $game.player_2.place_ship Ship.destroyer, params[:coordinates2_2], params[:orientation2_2]
    $game.player_2.place_ship Ship.cruiser, params[:coordinates2_3], params[:orientation2_3]
    $game.player_2.place_ship Ship.battleship, params[:coordinates2_4], params[:orientation2_4]
    $game.player_2.place_ship Ship.aircraft_carrier, params[:coordinates2_5], params[:orientation2_5]
    erb :placed_ships2
  end


  get '/start' do
    erb :start
  end

  get '/player1_turn' do 
    @aim1 = params[:aim1]
    $game.player_2.shoot @aim1.to_sym
    erb :player1_board
  end 

  get '/player2_turn' do 
    @aim2 = params[:aim2]
    $game.player_1.shoot @aim2.to_sym
    erb :player2_board
  end 




    # @aim = params[:aim]
    # random = Random_coordinates.new
    # $game.player_1.shoot @aim.to_sym
    # $game.player_2.shoot random.random_shot.to_sym
    # erb :action
    #end

end
