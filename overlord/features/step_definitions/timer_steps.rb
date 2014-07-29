When(/^I start the timer countdown$/) do
  click_button 'TIMER'
  click_button 'ENTER'
end

When(/^I set the timer to "(.*?)"$/) do |timer|

  click_button 'SET'

  timer.split('').each { |i| click_button i unless i == ':' }

  click_button 'ENTER'
end
