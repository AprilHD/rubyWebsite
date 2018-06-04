require 'sinatra'
require 'erb'
require "sass"
require './student'
require './comment'


configure do
	enable :sessions
	set :username, 'april'
	set :password, 'dong'
end

#### database
configure :development do
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
    DataMapper.auto_upgrade!
end

configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
    DataMapper.auto_upgrade!
end


get '/styles.css' do 
	scss :styles
end

#### Home 
get '/' do	
	@title = "Home"
  	erb :home
end

#### About
get '/About' do
	@title = "All About This Website"
	erb :about
end

#### Contact
get '/Contact' do
    erb :contact
end

#### Video
get '/Video' do
  	erb :video
end

#### Login
get '/Login_Logout' do
	halt(erb :login) unless session[:admin]
	session[:admin] = false
	session.clear
	redirect to ('/')
end


#### login
post '/Login_Logout' do
	if params[:username] == settings.username && params[:password] == settings.password
	 	session[:admin] = true
	 	erb :home
	else
		@dial = 'The username and/or password entered do not match our record, please try again!'
		erb :login 
	end	
end

#### error page
not_found do
  	erb :not_found
end





