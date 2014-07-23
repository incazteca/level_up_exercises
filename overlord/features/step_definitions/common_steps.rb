Given(/^a bomb$/) do
  visit '/'
end

Then(/^Bomb status should be "(.*?)"$/) do |status|
  visit '/'

  within '#status' do
    expect(page).to have_content status
  end
end
