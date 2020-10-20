# ex1
p "ex1---"

class NewStudent
  def initialize(name, creator)
    @name = name
    @school = school
  end
	
  def intro
    puts "I'm #{@name} and I go to #{@school}!"
  end
end

ellen = NewStudent.new("Ellen", "Ashford High School")
michael = NewStudent.new("Michael", "Rockwell High School")

# Based on the Ruby code, which of the following will output I'm Ellen and I go to Ashford High School!

ellen.intro

# exe2

p "ex2---"

class Smoothie
	def initialize(name, size, price)
    @name = name
    @size = size
    @price = price
  end
end

purple_detox = Smoothie.new("Purple Detox", "Large", 5.50)

# exe3

class Car
  attr_reader :model, :price
  attr_writer :price
  def initialize(model, price)
    @model = model
    @price = price
  end
end
nissan = Car.new("Maxima", 20000)
puts nissan.model #=> "Maxima"
puts nissan.price = 14000 #=> 14000
# puts nissan.model = "Altima" #=> Error

# exe4

# What is the correct syntax for declaring a class variable in the Ruby class BikeFactory?

# exe5

class VideoGame
	def initialize(title, year, platform)
    @title = title
    @year = year
    @platform = platform
  end
end

# mario = VideoGame.new("Mario 64", 1996, "Nintendo 64")

# exe6

# What Ruby keyword would allow the Cat class to directly inherit the attributes from the Pet class and reduce duplicate code?

# exe7

class Dog
  @@dogs = 0
  def initialize(breed)
    @breed = breed
    @@dogs +=1
  end
end

# @@dogs is class variable

# exe8

# How do we call the Ruby namespace Math to output the value of the constant E?

# scope resolution operator --> Math::E

# exe9

# require 'date'
# Date.new(2020,12,25)


