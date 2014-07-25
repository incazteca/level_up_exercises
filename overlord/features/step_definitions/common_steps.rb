Given(/^a bomb$/) do
  visit '/'
end

Then(/^Bomb status should be "(.*?)"$/) do |status|
  expect(page).to have_content status
end
