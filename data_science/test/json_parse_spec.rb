describe "JSON Parser" do
  it "Should parse JSON" do
    file = "/Users/freyes/development_zone/level_up_exercises/data_science/data/test_data.json"
    json_parser = JSONParser.new(file)
    parse = json_parser.parse
    parse.should equal([{:date => Date.new(2014,03,20), :cohort => "B", :result => 0}])
  end
end
