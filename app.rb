require 'sinatra/base'

class MillionaireGame < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    redirect '/name'
  end

  get '/name' do
    erb :play
  end

  post '/play' do
    redirect '/play'
  end

  get '/play' do
    erb :play
  end
end
