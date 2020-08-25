  VALID_CHOICES = %w(rock paper scissors)

  def prompt(message)
    puts("=> #{message}")
  end

  def valid_input?(choice)
    VALID_CHOICES.include?(choice)
  end

  def display_result(player, computer)
    if (player == 'rock' && computer == 'scissors') ||
       (player == 'paper' && computer == 'rock') ||
       (player == 'scissors' && computer == 'paper')
      prompt("You won!")
    elsif player == computer
      prompt("Draw!")
    else
      prompt("You lose!")
    end
  end

  loop do
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

    computer_choice = %w(rock paper scissors).sample

    puts ("You choose #{choice} and computer choice: #{computer_choice}")

    display_result(choice, computer_choice)

    prompt("Do you want to play again? Y or y for yes, otherwise no")
    answer = gets.chomp
    break if answer.downcase != 'y'
  end

  prompt("Thank you for playing!")
