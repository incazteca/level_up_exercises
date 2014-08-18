When(/^I start the timer countdown$/) do
  click_button 'TIMER'
  click_button 'ENTER'
end

When(/^I set the timer to "(.*?)"$/) do |timer|

  click_button 'SET'
  click_button 'TIMER'

  timer.split('').each { |i| click_button i unless i == ':' }

  click_button 'ENTER'

  # Hit Timer to get the time to display
  click_button 'TIMER'
end
