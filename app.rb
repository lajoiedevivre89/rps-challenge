require 'sinatra/base'

class RPS < Sinatra::Base 
  enable :sessions 
 
  get '/' do
    erb(:index) 
  end


  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
    #erb :play
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb (:play)
  end




  run! if app_file == $0
end