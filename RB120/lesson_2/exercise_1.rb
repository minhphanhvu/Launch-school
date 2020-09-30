# p1

puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# p2-3-4-5-6-7-8-9-10

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.name = "Luna"
kitty.greet
kitty.walk