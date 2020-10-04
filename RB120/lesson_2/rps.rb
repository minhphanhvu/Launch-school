module Message
  def message(mes)
    puts "=> #{mes}"
  end
end

class Move
  VALUES = ['r', 'p', 'sc', 'l', 'sp']
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

  def lizard?
    @value == 'l'
  end

  def spock?
    @value == 'sp'
  end

  def >(other_move)
    if rock? && (other_move.scissors? || other_move.lizard?) ||
       paper? && (other_move.spock? || other_move.rocks?) ||
       scissors? && (other_move.lizard? || other_move.paper?) ||
       lizard? && (other_move.spock? || other_move.paper?) ||
       spock? && (other_move.scissors? || other_move.rock?) 
      return true
    end
    false
  end

  def <(other_move)
    if rock? && (other_move.paper? || other_move.spock?) ||
       paper? && (other_move.scissors? || other_move.lizard?) ||
       scissors? && (other_move.rock? || other_move.spock?) ||
       lizard? && (other_move.scissors? || other_move.rock?) ||
       spock? && (other_move.paper? || other_move.lizard)
      return true
    end
    false
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :scores

  def initialize
    set_name
    @scores = 0
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose your move: r(Rock), p(Paper), sc(Scissors), l(Lizard), or sp(Spock)"
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
  include Message
  FINAL_SCORES = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      loop do
        puts
        human.choose
        computer.choose
        display_moves
        update_scores
        display_scores
        break if win?
      end
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
    message("#{human.name} chose #{human.move}.")
    message("#{computer.name} move #{computer.move}")
  end

  def update_scores
    if human.move > computer.move
      human.scores += 1
    elsif human.move < computer.move
      computer.scores += 1
    end
  end

  def display_scores
    if human.move > computer.move
      message("#{human.name} won this round!")
    elsif human.move < computer.move
      message("#{computer.name} won this round!")
    else
      message("A tie this round!")
    end
    message("Current scores: #{human.name} #{human.scores}, #{computer.name} #{computer.scores}")
  end

  def win?
    human.scores == FINAL_SCORES || computer.scores == FINAL_SCORES
  end

  def display_winner
    message("Final scores: #{human.name}: #{human.scores}, #{computer.name}: #{computer.scores}")
    if human.scores == FINAL_SCORES
      message("#{human.name} won!")
    else
      message("#{computer.name} won!")
    end
  end

  def reset_scores
    human.scores = 0
    computer.scores = 0
  end

  def play_again?
    puts "Do you want to play again? (y/n)"
    choice = ''
    loop do
      choice = gets.chomp
      break if %w(y n).include?(choice.downcase)
      puts "Invalid input, please choose again!"
    end
    if choice == 'y'
      reset_scores
      return true
    end
    false
  end
end

RPSGame.new.play
