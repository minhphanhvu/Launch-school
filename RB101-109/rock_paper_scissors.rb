require 'yaml'
VALID_CHOICES = %w(rock paper scissors)
MESSAGES = YAML.load_file("rock_paper_scissors.yml")

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
loop do
  def player_choose
    choice = ''
    loop do
      prompt("Choose one: rock, paper, scissors")
      choice = gets.chomp
      if valid_input?(choice)
        break
      else
        prompt("Invalid choice, please input again")
      end
    end
    choice
  end

  loop do
    choice = player_choose

    computer_choice = %w(rock paper scissors).sample

    puts("You choose #{choice} and computer choice: #{computer_choice}")

    display_result(choice, computer_choice)
  end
  prompt("Do you want to play again? yes or y for yes, otherwise no")
  answer = gets.chomp
  break if answer.downcase != 'y' || answer.downcase != 'yes'
end
prompt("Thank you for playing!")
