# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require 'Haml'
require_relative 'models/bomb.rb'

enable :sessions

get '/' do
  haml :index
end

post '/on' do
  session.clear
  session[:bomb] ||= Bomb.new
end

post '/set/activation_code' do
  session[:bomb].set_activation_code(params[:display].to_i)
end

post '/set/deactivation_code' do
  session[:bomb].set_deactivation_code(params[:display].to_i)
end

post '/set/timer' do
  session[:bomb].set_time(params[:display])
end

post '/start/timer' do
  session[:bomb].start_countdown(params[:display])
end

post '/activate' do
  session[:bomb].activate(params[:display].to_i)
end

post '/deactivate' do
  session[:bomb].deactivate(params[:display].to_i)
end

get '/status' do
  session[:bomb].status
end

