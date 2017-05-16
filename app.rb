ENV['RACK_ENV'] ||= 'development'
require './models/User'
require './models/Space'
require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class Makers_BNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    #Homepage
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
   if user
     session[:user_id] = user.id
     redirect('/users/main')
   else
     flash.now[:errors] = ['Email or Password is incorrect']
     erb(:'/sessions/new')
   end
 end


  get '/users/main' do
    erb :main
    # Account page. Create space and Rent Space links.
  end

  get '/spaces'do
    erb :spaces
    # From the Rent Space link on users/main
  end

  get '/space/rent' do
    #Click on a space you want to rent. Get taken to this form where you fill in what dates you want to rent or calander
  end

  post'rent_request' do
    #Post form for rent request
    #Redirect to /users/main
  end

  get'/spaces/new' do
    @space = Space.create(name: params[:name], city: params[:city], street: params[:street], postcode: params[:postcode], price: params[:price], description: params[:description], startDate: params[:startDate], endDate: params[:endDate])
    erb :'spaces/new'
  end

  post'/spaces' do

  end

  delete 'sessions/destroy' do
    #Sign out
  end

  run! if app_file == $0
end
