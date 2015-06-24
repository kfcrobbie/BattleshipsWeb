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
    @coordinates = params[:coordinates]

    # if @coordinates
      @board = $game.own_board_view $game.player_1
      $game.player_1.place_ship Ship.battleship, :A1
      erb :placed_ships
    
  end
end
