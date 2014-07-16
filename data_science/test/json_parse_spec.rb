describe "JSON Parser" do
  let(:file) { File.join(__FILE__, "data", "test_data.json") }
  let(:json_parser) { JSONParser.new(file) }

  it "Should parse JSON" do
    parse = json_parser.parse
    parse.should equal([
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "A", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "A", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 0},
                       {:date => Date.new(2014,03,20), :cohort => "B", :result => 1}
    ])
  end
end
