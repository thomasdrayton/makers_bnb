
ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'date'
require 'sinatra/flash'
require './data_mapper_setup'
require './helpers/helper'
require 'uk_postcode'
require 'mail'

class Makers_BNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    @spaces = Space.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect 'users/main'
    else
      flash.now[:errors] = ['Unable to sign you up.']
      redirect 'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/users/main')
    else
      flash.now[:errors] = ['Email or Password is incorrect']
      erb :'/sessions/new'
    end
  end

  get '/users/main' do
    erb :'users/main'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/requests' do
    space = Space.get(params[:space_id])
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    request = Request.create(startDateReq: start_date, endDateReq: end_date,
    user_id: params[:user_id], space_id: space.id, confirmed: "false")

    if request.possible?(space)
      request.save
      request.text_owner_of(space, request)
      flash.keep[:notice] = "Your booking was successfully made #{current_user.name}"
      redirect '/spaces'
    else

      flash.keep[:notice] = "The space that you are requesting is unavailable for those dates #{current_user.name}"
      redirect '/spaces'
    end
  end

  post '/request_confirm_or_decline' do
    request = Request.get(params[:request_id])
    if params[:response] == "accept"
      request.confirmed = 'accepted'
      request.save
      flash.keep[:notice] = "You have accepted a request from #{request.user.name}"
    elsif params[:response] == "decline"
      request.confirmed = 'declined'
      request.save
      flash.keep[:notice] = "You have declined a request from #{request.user.name}"
    elsif params[:response].nil?
      flash.keep[:notice] = "Please enter a valid response to the request from #{request.user.name}"
    end
    redirect '/requests'
  end


  get'/spaces/new' do
    erb :'spaces/new'
  end

  get '/requests' do
    redirect_if_not_signed_in
    @requests = current_user.spaces.requests
    erb :'requests/index'
  end

  get '/requests/new/:id' do
    @space = Space.get(params[:id])
    erb :'requests/new'
  end

  get '/requests' do
    @requests = current_user.spaces.requests
    erb :'/requests'
  end

  post'/spaces' do
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    postcode = Space.validate_postcode(params[:postcode])
    date = Space.validate_date(start_date, end_date)
    # params[:tags].split.each { |tag|
    #   space.tags << Tag.first_or_create(name: tag)
    # }

    if postcode && date
      space = Space.create(user_id: current_user.id, name: params[:name],

                           city: params[:city], street: params[:street],
                           postcode: params[:postcode], price: params[:price],
                           description: params[:description], startDate: params[:start_date],
                           endDate: params[:end_date])
      space.save

      if params[:file]
        filename = params[:file][:filename]
        file = params[:file][:tempfile]
        File.open("./public/images/#{filename}", 'wb') do |f|
          f.write(file.read)
          image = Image.create(image_url: filename, space_id: space.id)
          space.images << image
      else
      end

      flash.keep[:notice] = 'Space successfully created'

      redirect '/spaces'
    elsif date
      flash.keep[:notice] = 'Please enter a valid UK Postcode'
      redirect '/spaces/new'
    elsif postcode
      flash.keep[:notice] = 'Please Make sure your end date is after your start date'
      redirect '/spaces/new'
    else
      flash.keep[:notice] = 'Please Enter a Valid UK Postcode. Please Make sure your end date is after your start date'
      redirect '/spaces/new'
    end
  end

  delete '/sessions' do
    name = current_user.name
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye #{name}"
    redirect '/sessions/logout'
  end

  get '/sessions/logout' do
    erb :'sessions/logout'
  end

end
