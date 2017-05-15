require 'sinatra/base'

class Makers_BNB < Sinatra::Base

  get '/' do
    #Homepage
    erb :index
  end

  get '/users/new' do
    #Sign Up form
    erb :sign_up
  end

  post '/users' do
    #Users account page with New Space and Rent space links
    redirect 'users/main'
  end

  get '/sessions/new' do
    erb: sign_in
    # Goes to /users/main on sign in
  end

  get '/users/main' do
    erb: main
    # Account page. Create space and Rent Space links
  end

  get '/spaces'do
    erb: spaces
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
    #Form for adding new spaces
    erb :'spaces/new'
  end

  post'/spaces' do
    #Spaces params
  end

  delete 'sessions/destroy' do
    #Sign out
  end

  run! if app_file == $0
end
