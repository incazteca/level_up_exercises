require 'csv'
require 'json'
require 'pp'

class CSVParser
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def to_arr_of_hash
    contents = File.read(@path)
    CSV.parse(contents,headers: :true, header_converters: :symbol).map(&:to_hash)
  end

  def to_json
    hash_ar = to_arr_of_hash
    hash_ar.to_json
  end
end
