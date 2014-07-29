
When(/^I turn the bomb on$/) do
  click_button 'ON'
end

When(/^I activate it$/) do
  click_button 'ACTIVATE'
  click_button '1'
  click_button '2'
  click_button '3'
  click_button '4'
  click_button 'ENTER'
end

When(/^I set a new activation code and activate bomb with it$/) do
  click_button 'SET'
  click_button 'ACTIVATE'
  click_button '2'
  click_button '0'
  click_button '1'
  click_button '4'
  click_button 'ENTER'

  click_button 'ACTIVATE'
  click_button '2'
  click_button '0'
  click_button '1'
  click_button '4'
  click_button 'ENTER'
end

When(/^I enter wrong activation code$/) do
  click_button 'ACTIVATE'
  click_button '2'
  click_button '0'
  click_button '1'
  click_button '4'
  click_button 'ENTER'
end

When(/^I unsuccessfully activate the bomb (\d+) times$/) do |attempts|
  attempts.to_i.times do
    click_button 'ACTIVATE'
    click_button '4'
    click_button '3'
    click_button '2'
    click_button '1'
    click_button 'ENTER'
  end
end
