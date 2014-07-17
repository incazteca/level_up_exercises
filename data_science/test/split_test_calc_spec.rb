require_relative('../src/split_test_calc.rb')

describe SplitTestCalc do
  let(:file) { File.join('.', "data", "test_data.json") }
  let(:calc) { SplitTestCalc.new(file) }

  it "stores file path" do
    expect(calc.path).to equal(file)
  end

  it "sums up total sample size" do
    expect(calc.total_sample_size).to equal(10)
  end

  it "calculates conversion rate" do
    expect(calc.conversion_rate('A')).to equal(0.0)
    expect(calc.conversion_rate('B')).to equal(0.125)
  end

  it "calculates standard error" do
    expect(calc.standard_error('A')).to equal(0.0)
    expect(calc.standard_error('B')).to equal(Math.sqrt(0.125 * (1 - 0.125) / 8))
  end

  it "sums users in cohort A" do
    expect(calc.cohort_a_total).to eq(2)
  end

  it "sums converted users in cohort A" do
    expect(calc.cohort_a_converts).to eq(0)
  end

  it "sums users in cohort B" do
    expect(calc.cohort_b_total).to eq(8)
  end

  it "sums converted users in cohort B" do
    expect(calc.cohort_b_converts).to eq(1)
  end

  it "calculates error bars with 95% confidence" do
    expect(calc.error_bars('B')).to equal(calc.standard_error('B') * 1.96)
  end

  it "decides if cohort A is better than cohort B" do
    expect(calc.cohort_a_better?).to equal(false)
  end
end
