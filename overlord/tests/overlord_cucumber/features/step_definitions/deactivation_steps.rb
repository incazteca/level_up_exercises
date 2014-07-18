require 'uri'
require 'net/http'
require 'json'

Given(/^an activated bomb$/) do

  @bomb_api = Net::HTTP.new('127.0.0.1', 4567)
  request = Net::HTTP::Post.new('/on')

  @bomb_api.request(request)

  request = Net::HTTP::Post.new('/activate')
  request.set_form_data({:activation_code => 1234})

  @bomb_api.request(request)
end

When(/^I deactivate it$/) do

  request = Net::HTTP::Post.new('/deactivate')
  request.set_form_data({:deactivation_code => 0000})

  @bomb_api.request(request)

  status_req = Net::HTTP::Get.new('/status')
  @status = @bomb_api.request(status_req)
end

Then(/^Bomb status should be "(.*?)"$/) do |status|
  @status.should == status
end
