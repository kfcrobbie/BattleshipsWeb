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
    @coordinates1 = params[:coordinates1]
    @orientation1 = params[:orientation1]
    @coordinates2 = params[:coordinates2]
    @orientation2 = params[:orientation2]
    @coordinates3 = params[:coordinates3]
    @orientation3 = params[:orientation3]
    @coordinates4 = params[:coordinates4]
    @orientation4 = params[:orientation4]
    @coordinates5 = params[:coordinates5]
    @orientation5 = params[:orientation5]

    # if @coordinates
    $game.player_1.place_ship Ship.battleship, @coordinates1, @orientation1
    $game.player_1.place_ship Ship.battleship, @coordinates2, @orientation2
    $game.player_1.place_ship Ship.battleship, @coordinates3, @orientation3
    $game.player_1.place_ship Ship.battleship, @coordinates4, @orientation4
    $game.player_1.place_ship Ship.battleship, @coordinates5, @orientation5
    @board = $game.own_board_view $game.player_1
    erb :placed_ships
    
  end
end
