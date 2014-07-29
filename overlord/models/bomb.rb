require 'pry'
class Bomb

  attr_accessor :activation_code, :deactivation_code, :status, :timer, :deactivation_attempts, :detonation_time

  def initialize
    @activation_code = "1234"
    @deactivation_code = "0000"
    @status = 'DEACTIVATED'
    @timer = 30 # in seconds
    @deactivation_attempts = 0
    @detonation_time = 0
  end

  def activate(code)
    @status = 'ACTIVE' if @activation_code == code && code_valid?(code)
  end

  def deactivate(code)
    @deactivation_attempts += 1

    if @deactivation_code == code && code_valid?(code)
      @status = 'DEACTIVATED'
      @deactivation_attempts = 0
    end

    detonate if @deactivation_attempts == 3
  end

  def set_activation_code(code)
    @activation_code = code if code_valid?(code)
  end

  def set_deactivation_code(code)
    @deactivation_code = code if code_valid?(code)
  end

  def set_time(bomb_time)
    return unless @status == "ACTIVE"

    hours, minutes, seconds = bomb_time.split(':')

    @timer = seconds.to_i + (minutes.to_i * 60) + (hours.to_i * 60 * 60)
  end

  def start_countdown()
    return unless @status == "ACTIVE"

    @detonation_time = @timer + Time.now.utc.to_i
  end

  def bomb_detonated?
    @detonation_time <= Time.now.utc.to_i && detonation_time != 0
  end

  def detonate
    @status = 'BOOM'
  end

  def status
    detonate if bomb_detonated?
    @status
  end

  private

  def code_valid?(code)
    /\d{4}/ =~ code
  end

end
