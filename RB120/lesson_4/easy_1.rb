# p2

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# check go_fast
car = Car.new
car.go_fast

# p3

# the self refers to the object (object level) --> the `class` method then will invoke on this object
# this method then returns what class this objects belongs to --> Car
# no need to use to_s since it is in interpolation

# p4

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
angry_cat = AngryCat.new

# p5

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

pizza = Pizza.new("apple")
p pizza.instance_variables
# use `instance_variables` method

# p6

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# use `instance_variable_get` if no getter method is defined

# p7

# to_s: return (not puts) name of the object's class and its object id

# p8

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

# `self` referes to the object of the class Cat

# p9

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# `self` here refers to the class Cat

# p10

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

