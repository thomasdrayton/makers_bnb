require 'sinatra/base'

class Makers_BNB < Sinatra::Base

  get '/' do
    "Hello"
  end

  run! if app_file == $0
end
