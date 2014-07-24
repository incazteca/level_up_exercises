class Bomb

  attr_accessor :activation_code, :deactivation_code, :status, :timer

  def initialize
    @activation_code = 1234
    @deactivation_code = 0000
    @status = 'DEACTIVATED'
    @timer = 30
    @deactivation_attempts = 0
  end

  def activate(code)
  end

  def deactivate(code)
  end

  def set_activation_code(code)
  end

  def set_deactivation_code(code)
  end

end
