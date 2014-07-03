require 'csv'
require 'json'
require 'pp'

class CSVParser
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def to_arr_of_hash
    head = Array.new
    data = Array.new

    res_hash = Array.new
    i = 0

    CSV.foreach(@path) do |row|
      head.push(row) if i == 0

      if i > 0
        data.push(row)

        temp_hold = Array.new
        head.last.length.times do |j|
          temp_hold.push(head.last[j])
          temp_hold.push(data.last[j])
        end

        res_hash.push(Hash[*temp_hold])

      end
      i += 1
    end

    res_hash

  end

  def to_json
    hash_ar = to_arr_of_hash

    hash_ar.to_json
  end
end
