class NameCollisionError < RuntimeError; end;

class Robot
  attr_accessor :name

  def initialize()
    @@registry ||= []
    @name = ''

    name_generator
    @@registry << @name if name_valid?
  end

  def valid_characters
    ('A'..'Z').to_a + ('0'..'9').to_a
  end

  def name_generator
    5.times { @name += valid_characters.sample }
  end

  def name_valid?
    if @@registry.include?(@name)
      raise NameCollisionError, 'THere was a problem generating the robot name!'
    end
  end

end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

6.times do |i|
  puts "My other robit is named: #{Robot.new.name}"
end


# Errors!
# generator = -> { 'AA111' }
# Robot.new(name_generator: generator)
# Robot.new(name_generator: generator)
