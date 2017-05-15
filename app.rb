require 'sinatra/base'

class Makers_BNB < Sinatra::Base

  get '/' do
    erb: index
  end

  get '/sign_up' do
    erb: sign_up
  end

  get '/sign_in' do
    erb: sign_in
  end

  run! if app_file == $0
end
