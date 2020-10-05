# p1

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

# Line 14 returns "You will" + anything by probability in the list of choices

# p2

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# same as problems, however only the list of choices are different, since it override the default in superclass (lookup path)

# p3

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# use functio `ancestors` on a class (cannot call on an instance)

p HotSauce.ancestors

# p4

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# use attr_acessor, then user getter or setter to replace anyu @instance variable

# p5

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

# top to bottom: local variable, instance variable, class variable

# p6

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# class method have `self`, otherwise it's instance method

# p7

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

# @@cats_count is a class variable, it's incre by 1 everytime an instance is initialized
# we can call cats_count after every time we instantiate a new object of Cat class

# p8

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# p9

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# the new method play in the Bingo class will override the one in Game class

# p10

# DIY
# easy to maintain codes
# offer trade-off between flexibility and maintaining codes
# big projects are easy to maintian
# conceptualization: nouns and verbs
