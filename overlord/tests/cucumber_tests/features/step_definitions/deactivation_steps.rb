require 'capybara'
require 'capybara/cucumber'
require_relative '../../../../src/controllers/overlord'

Capybara.app = Sinatra::Application.new
Capybara.javascript_driver = :webkit

Given(/^an activated bomb$/) do
  click_button 'Activate'
  click_button '1'
  click_button '2'
  click_button '3'
  click_button '4'
  click_button 'Enter'
end

When(/^I deactivate it$/) do
  click_button 'Deactivate'
  click_button '0'
  click_button '0'
  click_button '0'
  click_button '0'
  click_button 'Enter'
end
