class Palindromes
  attr_reader :max, :min, :hash

  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @hash = Hash.new { |h, k| h[k] = [] }
  end

  def generate
    products = (@min..@max).to_a.repeated_combination(2).to_a.select do\
       |num1, num2|
      palindrome?(num1, num2)
    end
    products.each { |product| hash[product.reduce(:*)] << product }
  end

  def smallest
    Palindrome.new(hash.min[0], hash.min[1])
  end

  def largest
    Palindrome.new(hash.max[0], hash.max[1])
  end

  private

  def palindrome?(num1, num2)
    (num1 * num2).to_s == (num1 * num2).to_s.reverse
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
