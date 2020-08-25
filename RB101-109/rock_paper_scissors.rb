require 'yaml'
VALID_CHOICES = %w(rock paper scissors)
MESSAGES = YAML.load_file("rock_paper_scissors.yml")

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
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if player == computer
    prompt("Draw!")
  elsif win?(player, computer)
    prompt("You win!")
  else
    prompt("You lose!")
  end
end

def player_choose
  choice = ''
  loop do
    prompt(MESSAGES["option_choose"])
    choice = gets.chomp
    if valid_input?(choice)
      break
    else
      prompt(MESSAGES["invalid_choice"])
    end
  end
  choice
end

def computer_choose
  %w(rock paper scissors).sample
end

def display_choices(player_choice, computer_choice)
  puts("You choose #{player_choice} and computer choice: #{computer_choice}")
end

def play_again?
  prompt(MESSAGES["play_again"])
  answer = gets.chomp
  answer.downcase == 'y' || answer.downcase == 'yes'
end

loop do
  system_clear

  choice = player_choose

  computer_choice = computer_choose

  display_choices(choice, computer_choice)

  display_result(choice, computer_choice)

  break unless play_again?
end

system_clear

prompt(MESSAGES["goodbye"])
