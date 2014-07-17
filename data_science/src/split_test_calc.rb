require 'pp'
include Math

require_relative('json_parser.rb')

class SplitTestCalc
  attr_accessor :path, :cohort_a_total, :cohort_b_total, :cohort_a_converts, :cohort_b_converts, :total_sample_size

  def initialize(path)
    @path = path
    @cohort_a_total = 0
    @cohort_b_total = 0
    @cohort_a_converts = 0
    @cohort_b_converts = 0
    @total_sample_size = 0

    JSONParser.new(path).to_arr_of_hash.each do |elem|
      cohort_a_summing(elem[:result]) if elem[:cohort] == "A"
      cohort_b_summing(elem[:result]) if elem[:cohort] == "B"
      @total_sample_size += 1
    end
  end

  def conversion_rate(cohort)
    Float(@cohort_a_converts) / Float(@cohort_a_total) if cohort == "A"
    Float(@cohort_b_converts) / Float(@cohort_b_total) if cohort == "B"
  end

  def standard_error(cohort)
    p = conversion_rate(cohort)

    Math.sqrt(p * (1 - p) / @cohort_a_total) if cohort == "A"
    Math.sqrt(p * (1 - p) / @cohort_b_total) if cohort == "B"
  end

  private

  def cohort_a_summing(result)
    @cohort_a_total += 1
    @cohort_a_converts += 1 if result == 1
  end

  def cohort_b_summing(result)
    @cohort_b_total += 1
    @cohort_b_converts += 1 if result == 1
  end
end

