# p1

class Machine
  def initialize(state)
    @state = :off
  end

  def state
    @state
  end

  def change_state
    flip_switch
  end

  private 

  def switch=(desired_state)
    @state = desired_state
  end

  def flip_switch
    if self.state == :off
      self.switch=(:on)
    else
      self.switch=(:off)
    end
  end
end

machine = Machine.new(:off)
p machine.state
p machine.change_state
p machine.state

# p2
p "p2----"
class IndexError < StandardError
  def message
    "Index Out of bound"
  end
end

class FixedArray
  attr_reader :size, :array

  def initialize(size)
    @array = Array.new(size)
    @size = size
  end

  def [](index)
    if index < -size || index >= size
      raise IndexError
    end
    @array[index]
  end

  def to_a
    @array
  end

  def []=(index, value)
    if index < -size || index >= size
      raise IndexError
    end
    @array[index] = value
  end

  def to_s
    @array
  end
end

fixed_array = FixedArray.new(5)
p fixed_array[3] == nil
p fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
p fixed_array[3] == 'a'
p fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
p fixed_array[1] == 'b'
p fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
p fixed_array[1] == 'c'
p fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
p fixed_array[4] == 'd'
p fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
p fixed_array.to_s == [nil, "c", nil, "a", "d"]

p fixed_array[-1] == 'd'
p fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError 
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

# p3

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super(name, year)
  end
end

# p4

class CircularQueue
  def initialize(size)
    @q = Array.new
    @size = size
  end

  def dequeue
    @q.shift
  end

  def enqueue(item)
    dequeue if @q.size == @size
    @q.push item
  end
end

p "p4---"
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# p6

# p8

class Card
  include Comparable
  attr_reader :rank, :suit

  CARDS = (2..10).to_a + %w(Jack Queen King Ace)
  VALUES = (2..14).to_a
  RANKS = CARDS.zip(VALUES).to_h

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank.to_s} of #{suit}"
  end

  def <=>(other)
    RANKS[self.rank] <=> RANKS[other.rank]
  end
end

p "p8----"
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

# p9

p "p9---"

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  attr_reader :deck

  def initialize
    @deck = RANKS.product(SUITS).shuffle.map do |pair|
      Card.new(pair[0], pair[1])
    end
  end

  def draw
    @deck = new_deck if @deck.size == 0
    @deck.shuffle
    @deck.shift
  end

  protected 
  def new_deck
    @deck = RANKS.product(SUITS).shuffle.map do |pair|
      Card.new(pair[0], pair[1])
    end
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

# p10

# Include Card and Deck classes from the last two exercises.

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# testing

# 5 of Clubs
# 7 of Diamonds
# Ace of Hearts
# 7 of Clubs
# 5 of Spades
# Two pair
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true