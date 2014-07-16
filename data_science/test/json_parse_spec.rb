require_relative('../src/json_parser.rb')

describe JSONParser do
  let(:file) { File.join('.', "data", "test_data.json") }
  let(:json_parser) { JSONParser.new(file) }

  it "store file path" do
    expect(json_parser.path).to equal(file)
  end

  it "parses JSON to an array of hashes" do
    expect(json_parser.to_arr_of_hash).to eq([
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "A", :result => 0},
      {:date => "2014-03-20", :cohort => "A", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 0},
      {:date => "2014-03-20", :cohort => "B", :result => 1}
    ])
  end
end
