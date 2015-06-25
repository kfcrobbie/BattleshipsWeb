require 'sinatra/base'
require 'battleships'


class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  set :views, proc { File.join(root, '..','views') }

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/input_name' do
    erb :get_name
  end

  get '/new_game' do
    @name = params[:name]

    if @name == "" || !@name
      redirect '/input_name'
    else
      $game = Game.new Player, Board
      @board = $game.own_board_view $game.player_1
      erb :newgame_screen
    end
  end

  get '/place_ships' do
    $game.player_1.place_ship Ship.submarine, params[:coordinates1], params[:orientation1]
    $game.player_1.place_ship Ship.destroyer, params[:coordinates2], params[:orientation2]
    $game.player_1.place_ship Ship.cruiser, params[:coordinates3], params[:orientation3]
    $game.player_1.place_ship Ship.battleship, params[:coordinates4], params[:orientation4]
    $game.player_1.place_ship Ship.aircraft_carrier, params[:coordinates5], params[:orientation5]
    erb :placed_ships
  end

  get '/action' do
    @aim = params[:aim]
    $game.player_1.shoot @aim.to_sym
    erb :action
  end
end
