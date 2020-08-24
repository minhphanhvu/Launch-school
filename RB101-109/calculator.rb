  def prompt(message)
    puts("=> #{message}")
  end

  prompt("Welcome to calculator! Enter your name:")

  def operation_to_message(op)
    result = case op
    when '1'
      "Adding"
    when '2'
      "Subtracting"
    when "3"
      "Multiplying"
    when "4"
      "Dividing"
    end
    result
  end

  name = ""
  loop do
    name = Kernel.gets().chomp()

    if name.empty?()
      prompt("Make sure to use a valid name.")
    else
      break
    end
  end

  def valid_number?(num)
    /^\d+$/.match(num)
  end

  prompt("Hi #{name}")

loop do
  number1 = ''
  loop do
    prompt("What's your first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Invalid number, please try again.")
    end
  end

  number2 = ''
  loop do
    prompt("What's your second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Invalid number, please try again.")
    end
  end

  operator_prompt = <<-MSG
  What operator would you like to perform?
    1) add
    2) subtraction
    3) Multiply
    4) Divide
  MSG
  prompt(operator_prompt)

  operator = ""
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Choose one of 1, 2, 3, or 4 please!")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator 
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_i() / number2.to_i()
           end
  
  prompt("Your result is: #{result}")
  
  prompt("Do you want to perform another calculation? (Y or y to calculate agian, otherwise please input anything character and press enter)")

  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

    

  
  


