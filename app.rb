require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    @game = RPSGame.new(params[:play])
    erb :rps_game
  end
end
