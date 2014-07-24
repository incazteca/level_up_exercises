# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require 'Haml'
require_relative 'models/bomb.rb'

enable :sessions

get '/' do
  haml :index
end

post '/on' do
  session[:bomb] ||= Bomb.new
end

post '/set/activation_code' do
  session[:bomb].set_activation_code(param[:activation_code])
end

post '/set/deactivation_code' do
  session[:bomb].set_deactivation_code(param[:activation_code])
end

post '/set/bomb_timer' do
  session[:bomb].set_deactivation_code(param[:activation_code])
end

post '/activate' do
  session[:bomb].activate(param[:activation_code])
end

post '/deactivate' do
  session[:bomb].deactivate(param[:activation_code])
end

get '/status' do
  bomb = session[:bomb]
  bomb.status
end

