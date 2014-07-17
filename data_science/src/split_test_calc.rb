require 'pp'
include Math
require 'pry'

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
    @chi_cutoff = 3.84

    JSONParser.new(path).to_arr_of_hash.each do |elem|
      cohort_a_summing(elem[:result]) if elem[:cohort] == "A"
      cohort_b_summing(elem[:result]) if elem[:cohort] == "B"
      @total_sample_size += 1
    end
  end

  def conversion_rate(cohort)
    if cohort == 'A'
      Float(@cohort_a_converts) / Float(@cohort_a_total)
    elsif cohort == 'B'
      Float(@cohort_b_converts) / Float(@cohort_b_total)
    end
  end

  def standard_error(cohort)
    p = conversion_rate(cohort)

    if cohort == 'A'
      Math.sqrt(p * (1 - p) / @cohort_a_total)
    elsif cohort == 'B'
      Math.sqrt(p * (1 - p) / @cohort_b_total)
    end
  end

  def error_bars(cohort)
    standard_error(cohort) * 1.96
  end

  def cohort_a_better?
    chi_square > @chi_cutoff
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

  def chi_square
    a = @cohort_a_converts
    b = @cohort_a_total - @cohort_a_converts
    c = @cohort_b_converts
    d = @cohort_b_total - @cohort_b_converts
    n = @total_sample_size

    Float(n * ( (a * d) - (b * c) )**2) / Float((a + b) * (c + d) * (b + d) * (a + c))
  end
end

calc = SplitTestCalc.new(File.join('.', "data", "source_data.json"))

puts "Conversion Rate for Cohort A: #{(calc.conversion_rate('A') * 100).round(2)}% +/- #{(calc.error_bars('A') * 100).round(2)}%"
puts "Conversion Rate for Cohort B: #{(calc.conversion_rate('B') * 100).round(2)}% +/- #{(calc.error_bars('B') * 100).round(2)}%"

puts "Stay with cohort A" if calc.cohort_a_better?
puts "Switch to cohort B" if !calc.cohort_a_better?
