require 'json'

class JSONParser
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def to_arr_of_hash
    contents = File.read(@path)
    JSON.parse(contents, symbolize_names: :true)
  end
end
