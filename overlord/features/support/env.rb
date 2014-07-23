require File.join(File.dirname(__FILE__), *%w[.. .. overlord])

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Sinatra::Application.new
