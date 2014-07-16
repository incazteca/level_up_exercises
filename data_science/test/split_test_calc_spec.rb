describe SplitTestCalc do
  let(:file) { File.join(__FILE__, "data", "test_data.json") }
  let(:calc) { SplitTestCalc.new(file) }

  it "sums up total sample size" do
    expect(calc.total_sample_size).to equal(10)
  end

  it "calculates conversion rate" do
    expect(calc.conversion_rate('a')).to equal(0)
    expect(calc.conversion_rate('b')).to equal(0.125)
  end

  it "calculates standard error" do
    expect(calc.standard_error('a')).to equal(Math.sqrt(0.125 * (1 - 0.125) / 8))
  end

  it "sums users in cohort A" do
    expect(calc.cohort_a_total).to equal(2)
  end

  it "sums converted users in cohort A" do
    expect(calc.cohort_a_converts).to equal(0)
  end

  it "sums users in cohort B" do
    expect(calc.cohort_b_total).to equal(8)
  end

  it "sums converted users in cohort B" do
    expect(calc.cohort_b_converts).to equal(1)
  end
end
