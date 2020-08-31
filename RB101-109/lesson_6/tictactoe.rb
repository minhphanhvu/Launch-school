INITIAL_MARKER = ' '
PLAYER_MARK = "X"
COMP_MARK = "O"

# methods defined

def prompt(mes)
  puts " #{mes}"
end

def display_board(board_hsh)
  system 'clear'
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

def player_move!(board_hsh)
  square = ""
  loop do
    prompt "Choose a square (#{empty_squares(board_hsh).join(', ')}): "
    square = gets.chomp.to_i
    if empty_squares(board_hsh).include?(square)
      break
    else
      prompt "Invalid choice."
    end
  end
  board_hsh[square] = PLAYER_MARK
end

def comp_move!(board_hsh)
  square = empty_squares(board_hsh).sample
  board_hsh[square] = COMP_MARK
end

def board_full?(board_hsh)
  empty_squares(board_hsh) == []
end

def won?(board_hsh)
  !!who_win(board_hsh)
end

def who_win(board_hsh)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if line.all? { |num| board_hsh[num] == PLAYER_MARK }
      return "Player"
    elsif line.all? { |num| board_hsh[num] == COMP_MARK }
      return "Computer"
    end
  end
  nil
end

# main program

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_move!(board)
    break if won?(board) || board_full?(board)

    comp_move!(board)
    break if won?(board) || board_full?(board)
  end

  display_board(board)

  if won?(board)
    prompt "#{who_win(board)} won!"
  else
    prompt "Tie!"
  end

  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tictactoe!"
