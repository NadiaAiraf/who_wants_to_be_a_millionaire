require 'sinatra/base'
require './lib/game'

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
    session[:game] = Game.new
    erb :play
  end

  post '/play' do
    if session[:game].answer_correct?(params[:answer])
    session[:game].change_question
    redirect '/play'
    else
      redirect '/gameover'
    end
  end

  get '/play' do
    erb :play
  end

  get '/gameover' do
    erb :gameover
  end
end
