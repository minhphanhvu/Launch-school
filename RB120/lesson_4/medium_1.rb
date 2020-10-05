# p1

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# the balance is refering to instance method defined by attr_reader

# p2

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

entry = InvoiceEntry.new("entry", 2)
p entry.quantity
entry.update_quantity(3)
p entry.quantity

# p3

# p4

class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def self.hi 
    hello = Greeting.new
    hello.greet("Hello")
  end
end

class Goodbye  < Greeting
  def self.bye
    bye = Greeting.new
    bye.greet("Goodbye")
  end
end

# p5

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    @filling_type = "Plain" if @filling_type == nil
    @glazing = "" if @glazing == nil
    "#{@filling_type} with #{@glazing}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  #=> "Plain"

puts donut2
  #=> "Vanilla"

puts donut3
  #=> "Plain with sugar"

puts donut4
  #=> "Plain with chocolate sprinkles"

puts donut5
  #=> "Custard with icing"

# p6

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# if we use getter emthod, `self` or not does not matter much
# however, if we use setter, `self` is important to let ruby know we do not initialize a local variable

# p7

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end
end
