# p1 p2

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# define `self.hi` and create a new object in that method, and use the object of Greeting class to call the `greet` method\

# p3

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat1 = AngryCat.new(2, "angela")
cat2 = AngryCat.new(4, "bob")

# p4

class Cat
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

# p5

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# tv = Television.new
# tv.manufacturer # error
# tv.model

# Television.manufacturer
# Television.model # error

# p6

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# p7

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

