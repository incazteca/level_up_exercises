require 'pp'
class NameCollisionError < RuntimeError; end;

class Robot
  attr_accessor :name
  @@registry

  def initialize(args = {})
    @@registry ||= []

    @name = generate_name(args[:name_generator])
    raise NameCollisionError, 'There was a problem generating the robot name!' unless name_valid?(@name)

    @@registry << @name
  end

  private

  def generate_name(generator)
    if generator
      generator.call
    else
      "#{generate_char}#{generate_char}#{generate_num}#{generate_num}#{generate_num}"
    end
  end

  def name_valid?(name)
    (name =~ /[[:alpha:]]{2}[[:digit:]]{3}/) && !@@registry.include?(name)
  end

  def generate_char
    ('A'..'Z').to_a.sample
  end

  def generate_num
    rand(10)
  end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
generator = -> { 'AA111' }
puts "My other robo is #{Robot.new(name_generator: generator).name}"
generator = -> { 'A1111' }
puts "My third robo is #{Robot.new(name_generator: generator).name}"
#
