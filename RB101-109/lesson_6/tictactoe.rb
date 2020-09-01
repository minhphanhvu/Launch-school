require 'byebug'
INITIAL_MARKER = ' '
PLAYER_MARK = "X"
COMP_MARK = "O"
WINS_NEEDED = 2
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

# methods defined

def prompt(mes)
  puts "=> #{mes}"
end

def system_clear
  system 'clear'
end

def display_board(board_hsh)
  puts "Your marker: #{PLAYER_MARK}, computer marker: #{COMP_MARK}"
  puts ""
  puts "     |     |     "
  puts "  #{board_hsh[1]}  |  #{board_hsh[2]}  |  #{board_hsh[3]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_hsh[4]}  |  #{board_hsh[5]}  |  #{board_hsh[6]}   "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_hsh[7]}  |  #{board_hsh[8]}  |  #{board_hsh[9]}   "
  puts "     |     |     "
  puts ""
end

def initialize_board
  board = {}
  (1..9).each { |num| board[num] = INITIAL_MARKER }
  board
end

def empty_squares(board_hsh)
  board_hsh.keys.select { |num| board_hsh[num] == INITIAL_MARKER }
end

def joinor(array, delimiter = ', ', last_word = "or")
  array = array.join.split("")
  if array.length == 1
    array[0]
  elsif array.length == 2
    array[0] + " " + last_word + " " + array[1]
  else
    array[-1] = " #{last_word} #{array[-1]}"
    array[0...array.length - 1].join("#{delimiter}") + array[-1]
  end
end

def player_move!(board_hsh)
  square = ""
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board_hsh))}): "
    square = gets.chomp.to_i
    if empty_squares(board_hsh).include?(square)
      break
    else
      prompt "Invalid choice."
    end
  end
  board_hsh[square] = PLAYER_MARK
end

def comp_line(empty_mark, mark)
  comp_line = nil
  WINNING_LINES.each do |line|
    if line.one? { |square| board_hsh[square] == empty_mark}
      if board_hsh.values_at(*line).count(mark) == 2
        comp_line = line
      end
    end
  end
  comp_line
end

def off_def_comp(board_hsh)
  comp_line = nil
  comp_line = comp_line(COMP_MARK, INITIAL_MARKER)

  if !!comp_line
    return comp_line
  end

  WINNING_LINES.each do |line|
    if line.one? { |square| board_hsh[square] == INITIAL_MARKER }
      if board_hsh.values_at(*line).count(PLAYER_MARK) == 2
        return comp_line = line
      end
    end
  end
  comp_line
end

def comp_square(comp_line, board_hsh)
  if !!comp_line
    comp_line.select { |num| board_hsh[num] == INITIAL_MARKER }.first
  end
end

def comp_move!(board_hsh)
  square = comp_square(off_def_comp(board_hsh), board_hsh)
  if !!square
    board_hsh[square] = COMP_MARK
  else
    square = empty_squares(board_hsh).sample
    board_hsh[square] = COMP_MARK
  end
end

def board_full?(board_hsh)
  empty_squares(board_hsh) == []
end

def won?(board_hsh)
  !!who_win(board_hsh)
end

def who_win(board_hsh)
  WINNING_LINES.each do |line|
    if line.all? { |num| board_hsh[num] == PLAYER_MARK }
      return 'player'
    elsif line.all? { |num| board_hsh[num] == COMP_MARK }
      return "Computer"
    end
  end
  nil
end

def display_round_winner(board)
  if won?(board)
    prompt "#{who_win(board)} won this round!"
  else
    prompt "Tie this round!"
  end
end

def update_score(scores, board)
  if who_win(board) == 'player'
    scores['player'] += 1
  elsif who_win(board) == "Computer"
    scores['comp'] += 1
  end
end

def display_scores(scores)
  prompt "Your score: #{scores['player']}; computer scores: #{scores['comp']}"
end

def victory?(scores)
  scores['player'] == WINS_NEEDED || scores['comp'] == WINS_NEEDED
end

def display_final_victor(scores)
  if scores['player'] == WINS_NEEDED
    prompt "Congratulations! Your victory!"
  else
    prompt "Better luck next time, looks like the AI outsmarts you"
  end
end

def reset_scores(scores)
  scores['player'] = 0
  scores['comp'] = 0
end

# main program

scores = { 'player' => 0, 'comp' => 0 }

loop do
  reset_scores(scores)
  prompt("You need at least #{WINS_NEEDED} for a total victory!")

  loop do
    board = initialize_board

    loop do
      display_board(board)

      player_move!(board)
      break if won?(board) || board_full?(board)

      comp_move!(board)
      break if won?(board) || board_full?(board)
    end

    system_clear
    display_board(board)
    display_round_winner(board)

    update_score(scores, board)
    display_scores(scores)
    break if victory?(scores)
  end

  display_final_victor(scores)

  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  system_clear
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tictactoe!"
