describe Bomb do
  let (:bomb) { Bomb.new }

  it "turns on" do
    expect(bomb.status).to equal("Deactivated")
  end

  it "has initial activation code of 1234" do
    expect(bomb.activation_code).to equal(1234)
  end

  it "Can have user set activation code" do
    expect(bomb.activation_code).to equal(2014)
  end

  it "only accepts numeric input for activation code" do
    expect(bomb.activation_code).to !equal("abcd")
    expect(bomb.activation_code).to !equal("abc1")
  end

  it "stays activated once activated" do
    expect(bomb.status).to equal("Active")
  end

  it "has initial deactivation code of 0000" do
    expect(bomb.deactivation_code).to equal(0000)
  end

  it "can have user set deactivation code" do
    expect(bomb.deactivation_code).to equal(2014)
  end

  it "can be deactivated upon entering deactivation code" do
    expect(bomb.status).to equal("Deactivated")
  end

  it "will explode upon having incorrect deactivation code 3 times" do
    expect(bomb.status).to equal(nil)
  end

  it "has a timer with initial time of 30 seconds" do
    expect(bomb.timer).to equal(30)
  end

  it "has timer that can be set by user" do
    expect(bomb.timer).to equal(42)
  end

  it "explodes upon timer reaching 0" do
    expect(bomb.status).to equal(nil)
  end

  it "turns off" do
    expect(bomb.status).to equal("Off")
  end
end

