require 'sinatra/base'

class MillionaireGame < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
end
