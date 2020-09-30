# p1

# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting

# p2
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(name)
#     @name = name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name
# p kitty.identify

# p3

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end

#   def personal_greeting
#     puts "Hello! My name is #{self.name}"
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

# p9

# class Person
#   attr_writer :secret

#   def share_secret
#     puts self.secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

# p10

class Person
  attr_writer :secret

  def compare_secret(other)
    other.secret == self.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a secret!'

puts person1.compare_secret(person2)