
ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'date'
require 'sinatra/flash'
require './data_mapper_setup'
require './helpers/helper'
require "uk_postcode"
require 'mail'

class Makers_BNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    @spaces = Space.all #this is where we would filter for tags
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
    # Account page. Create space and Rent Space links
  end

  get '/spaces'do

    @spaces = Space.all

    erb :'spaces/index'

  end

  post '/filtered' do

    #@spaces = Space.all

    array = [:Pool, :Terrace, :Studio, :Wifi, :aircon, :Appartment, :Close_to_beach, :Balcony]
    array2 = []
    @tags  = Tag.all
    space_id_array = []
    @spaces = []
    @spaces2 = []

    for i in 0...array.length
      array2.push(array[i]) if params[array[i]] == "true"
    end

    for i in 0...array2.length
      @tags = @tags.all(array2[i].to_s.downcase.to_sym => "true")
    end

    @tags.each do |x|
      space_id_array.push(x.id)
    end

    #p space_id_array

    for i in 0...space_id_array.length
      @spaces.push(Space.all(:id => space_id_array[i]))
    end

    @spaces = @spaces.flatten

    p @spaces


    erb :'spaces/index'


  end

  post '/requests' do

    space = Space.get(params[:space_id])
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    request = Request.create(startDateReq: start_date, endDateReq: end_date,
    user_id: params[:user_id], space_id: space.id, confirmed: false)

    if request.possible?(space)
      request.save
      request.text_owner_of(space, request)
      flash.keep[:notice] = "Your booking was successfully made #{request.user.name}"
      redirect '/spaces'
    else

      flash.keep[:notice] = "The space that you are requesting is unavailable for those dates #{current_user.name}"
      redirect '/spaces'
    end
  end

  get '/space/rent' do
    #Click on a space you want to rent. Get taken to this form where you fill in what dates you want to rent or calander
  end

  post'rent_request' do
    #Post form for rent request
    #Redirect to /users/main
  end

  get'/spaces/new' do
    erb :'spaces/new'
  end

  get '/requests/new/:id' do
    @space = Space.get(params[:id])
    erb :'requests/new'
  end

  post'/spaces' do
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    postcode = Space.validate_postcode((params[:postcode]))
    date = Space.validate_date(start_date, end_date)
    # params[:tags].split.each { |tag|
    #   space.tags << Tag.first_or_create(name: tag)
    # }
    if postcode
      p params[:Pool]
      p params[:Terrace]
      tag_ = Tag.create(pool: params[:Pool], terrace: params[:Terrace], studio: params[:Studio], wifi: params[:Wifi],
      aircon: params[:aircon], appartment: params[:Appartment], close_to_beach: params[:Close_to_beach], balcony: params[:Balcony])


      if postcode && date

        space = Space.create(user_id: current_user.id, name: params[:name],
        city: params[:city], street: params[:street],
        postcode: params[:postcode], price: params[:price],
        description: params[:description], startDate: params[:start_date],
        endDate: params[:end_date], tag: tag_)

        space.save

        tag_.save

        flash.keep[:notice] = "Space successfully created"

        redirect '/spaces'
      elsif date
        flash.keep[:notice] = "Please enter a valid UK Postcode"
        redirect '/spaces/new'
      elsif postcode
        flash.keep[:notice] = "Please Make sure your end date is after your start date"
        redirect '/spaces/new'
      else
        flash.keep[:notice] = "Please Enter a Valid UK Postcode. Please Make sure your end date is after your start date"
        redirect '/spaces/new'
      end
    end
  end

  delete '/sessions' do
    email = current_user.email
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye #{email}"
    redirect '/sessions/logout'
  end


  get '/sessions/logout' do
    erb :'sessions/logout'
  end

  helpers do
    def send_mail(mail_subject, mail_body)
      mail = Mail.new do
        from    'DreamTeam@makersbnb.co.uk'
        to      'jaiye.s@gmail.com'
        subject mail_subject
        body    mail_body
      end
      mail.delivery_method :sendmail
      mail.deliver
    end

    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  run! if app_file == $0
end
end
