require 'sinatra/base'

class MillionaireGame < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/play' do
    redirect '/play'
  end

  get '/play' do
    erb :play
  end
end
