require File.join(File.dirname(__FILE__), *%w[.. .. overlord])

gem 'capybara', '2.3.0'
require 'capybara/cucumber'
require 'capybara-webkit'
require 'rspec'


Capybara.app = Sinatra::Application.new
Capybara.javascript_driver = :webkit
Capybara.match = :first
