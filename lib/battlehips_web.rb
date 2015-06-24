require 'sinatra/base'

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
      "Welcome to a new game, #{@name}"
    end
  end
end
