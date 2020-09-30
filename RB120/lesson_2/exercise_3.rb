# p1-2-3-4

# class Vehicle
#   attr_reader :year

#   def start_engine
#     "Ready to go!"
#   end

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   attr_reader :bed_type
#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end

#   def start_engine(speed)
#     super() + " Drive #{speed}, please!"
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1989, "short")
# puts truck1.start_engine('fast')

# p5-6

module Towable
  def tow
    puts "I can tow a trailer"
  end
end

class Vehicle
  attr_reader :year
  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year

#p7

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

# p10

module Transportation
  class Vehicle
  end

  class Car < Vehicle 
  end

  class Truck < Vehicle
  end
end