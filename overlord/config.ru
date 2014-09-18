require 'rubygems'
require 'bundler'
require File.join(File.dirname(__FILE__), 'overlord.rb')

configure :development do
  Bundler.require(:default, :development)
end

configure :test do
  Bundler.require(:test, :development, :default)
end

# root = ::File.dirname(__FILE__)
# require ::File.join( root, '.' )
# run MyApp.new


#use Rack::Static, :urls => %w(/css /js /fonts /partials /images), :root => 'public'
run Sinatra::Application.new
