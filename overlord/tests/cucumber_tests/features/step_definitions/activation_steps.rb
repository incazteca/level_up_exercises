require 'capybara'
require 'capybara/cucumber'
require_relative '../../../../src/controllers/overlord'

Capybara.app = Sinatra::Application.new
Capybara.javascript_driver = :webkit

When(/^I turn the bomb on$/) do
  click_button 'On/Off'
end

When(/^I activate it$/) do
  click_button 'Activate'
  click_button '1'
  click_button '2'
  click_button '3'
  click_button '4'
  click_button 'Enter'
end

