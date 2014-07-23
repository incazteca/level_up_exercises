require 'capybara'
require 'capybara/cucumber'
require_relative '../../../../src/overlord'

Capybara.app = Sinatra::Application.new

Given(/^a bomb$/) do
  visit('http://localhost:4567/')
end

Then(/^Bomb status should be "(.*?)"$/) do |status|
  visit('http://localhost:4567/status').should == status
end
