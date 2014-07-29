Given(/^a bomb$/) do
  visit '/'
  click_button 'ON'
end

Then(/^Bomb status should be "(.*?)"$/) do |status|
  expect(page).to have_field("status", with: status)
end

Then(/^bomb timer should be "(.*?)"$/) do |timer|
  expect(page).to have_field("display", with: timer)
end
