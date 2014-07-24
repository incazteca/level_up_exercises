Capybara.javascript_driver = :webkit

When(/^I turn the bomb on$/) do
  click_button 'ON/OFF'
end

When(/^I activate it$/) do
  click_button '1'
  click_button '2'
  click_button '3'
  click_button '4'
  click_button 'ACTIVATE'
end

