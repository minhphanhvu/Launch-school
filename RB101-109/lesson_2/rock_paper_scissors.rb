require 'yaml'
WINS_NEEDED = 5
VALID_CHOICES = %w(l p r sc sp)
MESSAGES = YAML.load_file("rock_paper_scissors.yml")

CHOICES = { 'r' => ['sc', 'l'], 'l' => ['p', 'sp'],
            'p' => ['r', 'sp'], 'sp' => ['sc', 'r'], 'sc' => ['p', 'l'] }

CHOICES_DISPLAY = { 'r' => "rock", 'l' => 'lizard',
                    'p' => 'paper', 'sc' => 'scissors', 'sp' => 'spock' }

# define methods
def system_clear
  system "clear"
end

def prompt(message)
  puts("=> #{message}")
end

def valid_input?(choice)
  VALID_CHOICES.include?(choice)
end

def win?(first, second)
  CHOICES[first].include?(second)
end

def display_result(player, computer)
  if player == computer
    prompt("Draw this round!")
  elsif win?(player, computer)
    prompt("You win this round!")
  else
    prompt("You lose this round!")
  end
end

def player_choose
  choice = ''
  loop do
    prompt(MESSAGES["option_choose"])
    choice = gets.chomp.downcase
    if valid_input?(choice)
      break
    else
      prompt(MESSAGES["invalid_choice"])
    end
  end
  choice
end

def computer_choose
  VALID_CHOICES.sample
end

def display_choices(player_choice, computer_choice)
  puts("You choose #{CHOICES_DISPLAY[player_choice]}\
 and computer choice: #{CHOICES_DISPLAY[computer_choice]}")
end

def valid_yes_no?(choice)
  choice == "yes" || choice == "y" || choice == "no" || choice == "n"
end

def ask_play_again
  prompt(MESSAGES["play_again"])
  gets.chomp
end

def play_again?(answer)
  answer.downcase == 'y' || answer.downcase == 'yes'
end

def display_winner(player_wins, computer_wins)
  if player_wins == 5
    prompt("You win with the final scores #{player_wins}:#{computer_wins}!")
  else
    prompt("You lose with the final scores #{player_wins}:#{computer_wins}!")
  end
end

def won_match?(score)
  score == WINS_NEEDED
end

#-- main program
loop do
  system_clear
  prompt(MESSAGES["game_explain"])
  prompt(MESSAGES["abbreviation_rules"])

  puts
  puts("You will need at least #{WINS_NEEDED} wins in total for victory!")
  player_wins = 0
  computer_wins = 0

  loop do
    puts
    prompt("Your turn: ")
    choice = player_choose
    puts
    computer_choice = computer_choose

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end

    display_choices(choice, computer_choice)
    display_result(choice, computer_choice)

    prompt("Your wins at this time: #{player_wins}")
    prompt("Computer wins: #{computer_wins}")
    break if won_match?(player_wins) || won_match?(computer_wins)
  end

  puts
  display_winner(player_wins, computer_wins)
  puts

  answer = ""
  loop do
    answer = ask_play_again
    if valid_yes_no?(answer)
      break
    else
      prompt("Invalid choice, please answer again!")
    end
  end

  break unless play_again?(answer)
end

# clear system and print out goodbye
system_clear

prompt(MESSAGES["goodbye"])
