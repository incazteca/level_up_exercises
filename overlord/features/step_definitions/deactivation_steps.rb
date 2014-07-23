require 'capybara'
require 'capybara/cucumber'
require_relative '../../../../src/overlord'

Capybara.app = Sinatra::Application.new
Capybara.javascript_driver = :webkit

Given(/^an activated bomb$/) do
  click_button 'ACTIVATE'
  click_button '1'
  click_button '2'
  click_button '3'
  click_button '4'
  click_button 'ENTER'
end

When(/^I deactivate it$/) do
  click_button 'DEACTIVATE'
  click_button '0'
  click_button '0'
  click_button '0'
  click_button '0'
  click_button 'ENTER'
end
