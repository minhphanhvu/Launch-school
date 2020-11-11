class WordProblem
  attr_accessor :numbers, :operators

  OPERATORS = {
    "plus" => "+",
    "minus" => "-",
    "divided by" => "/",
    "multiplied by" => "*"
  }

  def initialize(problem)
    @numbers = problem.scan(/-\d+|\d+/)
    @operators = problem.scan(/plus|minus|multiplied by|divided by/)
    raise ArgumentError if !valid?
  end

  def answer
    index = 1
    result = numbers[0].to_i

    while index < numbers.size
      result = result.send(OPERATORS[operators[index - 1]], numbers[index].to_i)
      index += 1
    end

    result
  end

  private

  def valid?
    OPERATORS.keys.each do |operator|
      return true if operators.include?(operator)
    end
    false
  end
end
