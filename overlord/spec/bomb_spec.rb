require_relative '../models/bomb'

describe Bomb do
  let (:bomb) { Bomb.new }

  it "turns on" do
    expect(bomb.status).to eq("DEACTIVATED")
  end

  it "has initial activation code of 1234" do
    expect(bomb.activation_code).to equal(1234)
  end

  it "Can have user set activation code" do
    bomb.set_activation_code(2014)
    expect(bomb.activation_code).to equal(2014)
  end

  it "only accepts numeric input for activation code" do
    bomb.set_activation_code("abcd")
    expect(bomb.activation_code).to !equal("abcd")

    bomb.set_activation_code("abc1")
    expect(bomb.activation_code).to !equal("abc1")
  end

  it "stays activated once activated" do
    bomb.activate(1234)
    expect(bomb.status).to eq("ACTIVE")
  end

  it "has initial deactivation code of 0000" do
    expect(bomb.deactivation_code).to equal(0000)
  end

  it "can have user set deactivation code" do
    bomb.set_deactivation_code(2014)
    expect(bomb.deactivation_code).to equal(2014)
  end

  it "can be deactivated upon entering deactivation code" do
    bomb.deactivate(0000)
    expect(bomb.status).to eq("DEACTIVATED")
  end

  it "will explode upon having incorrect deactivation code 3 times" do
    3.times { bomb.deactivate(0007) }
    expect(bomb.status).to eq('BOOM')
  end

  it "has a timer with initial time of 30 seconds" do
    expect(bomb.timer).to equal(30)
  end

  it "has timer that can be set by user" do
    bomb.set_time('0:00:42')
    expect(bomb.timer).to equal(42)
  end

  it "explodes upon timer reaching detonation time" do
    bomb.set_time('0:00:00')
    expect(bomb.status).to eq('BOOM')
  end
end

