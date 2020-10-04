class Move
  VALUES = ['r', 'p', 'sc']
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'sc'
  end

  def rock?
    @value == 'r'
  end

  def paper?
    @value == 'p'
  end

  def >(other_move)
    case @value
    when 'r'
      return true if other_move.scissors?
    when 'p'
      return true if other_move.rock?
    when 'sc'
      return true if other_move.paper?
    end
    false
  end

  def <(other_move)
    case @value
    when 'r'
      return true if other_move.paper?
    when 'p'
      return true if other_move.scissors?
    when 'sc'
      return true if other_move.rock?
    end
    false
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose your move: r(Rock), p(Paper), sc(Scissors)"
      choice = gets.chomp
      self.move = Move.new(choice)
      break if Move::VALUES.include?(choice)
      puts "Invalid input please try again"
    end
  end

  def set_name
    puts "What's your name?"
    n = ''
    loop do
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Samsung'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break if !play_again?
    end
    display_goodbye_message
  end

  protected

  def display_welcome_message
    puts "Welcome ot RPS Game! "
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} move #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "A tie!"
    end
  end

  def play_again?
    puts "Do you want to play again? (y/n)"
    choice = ''
    loop do
      choice = gets.chomp
      break if %w(y n).include?(choice.downcase)
      puts "Invalid input, please choose again!"
    end
    return true if choice == 'y'
    false
  end
end

RPSGame.new.play
