class SecretHandshake
  attr_accessor :input

  CHOICES = ["jump", "close your eyes", "double blink", "wink"]

  def initialize(input)
    valid_integer?(input) ? @input = binary_convert(input) : @input = "0"
  end

  def commands
    result = []
    input.size == 5 && input[0] == "1" ? reverse = true : reverse = false
    index = -1

    while !input[index].nil? && index != -5
      result << CHOICES[index] if input[index] == "1"
      index -= 1
    end

    result.reverse! if reverse
    result
  end

  private

  def valid_integer?(input)
    input.to_s.to_i == input || input.to_i.to_s == input
  end

  def binary_convert(input)
    binary_string = ""
    input = input.to_i

    while input != 0
      input.even? ? binary_string += "0" : binary_string += "1"
      input /= 2
    end

    binary_string.reverse
  end
end
