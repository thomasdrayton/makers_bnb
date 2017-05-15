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
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.id
    redirect 'users/main'
    redirect 'users/main'
  end

  get '/sessions/new' do
    erb :sign_in
    # Goes to /users/main on sign in
  end

  get '/users/main' do
    erb :main
    # Account page. Create space and Rent Space links
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
<<<<<<< HEAD
    #Form for adding new spaces
    erb :"spaces/new"
=======
    @space = Space.create(name: params[:name], city: params[:city], street: params[:street], postcode: params[:postcode], price: params[:price], description: params[:description], startDate: params[:startDate], endDate: params[:endDate]) 
    erb :'spaces/new'
>>>>>>> e768677a6dc22972abb6e4104986697c2061e133
  end

  post'/spaces' do

  end

  delete 'sessions/destroy' do
    #Sign out
  end

  run! if app_file == $0
end
