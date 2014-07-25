
Given(/^an activated bomb$/) do
  visit '/'

  click_button 'ON/OFF'

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

When(/^I set a new deactivation code and deactive bomb with it$/) do
  click_button 'SET'
  click_button 'DEACTIVATE'
  click_button '4'
  click_button '3'
  click_button '2'
  click_button '1'
  click_button 'ENTER'

  click_button 'DEACTIVATE'
  click_button '4'
  click_button '3'
  click_button '2'
  click_button '1'
  click_button 'ENTER'
end

When(/^I unsuccessfully deactivate the bomb (\d+) times$/) do |attempts|
  attempts.times do
    click_button 'DEACTIVATE'
    click_button '4'
    click_button '3'
    click_button '2'
    click_button '1'
    click_button 'ENTER'
  end
end
