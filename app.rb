require 'sinatra/base'
require './lib/game'
require './lib/winnings'
require './lib/ask_audience'

class MillionaireGame < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    p params
    session[:ask] = AskAudience
    session[:name] = params[:name]
    session[:winnings] = Winnings.new
    redirect '/name'
  end

  get '/name' do
    session[:game] = Game.new
    erb :play
  end

  post '/play' do
    session[:game].submit_answer(params[:answer])
    redirect '/success' if session[:game].question_number == 15
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

  get '/success' do
    erb :success
  end
end
