class Octal
  def initialize(oct)
    @oct = oct
  end

  def to_decimal
    return 0 if !valid?
    decimal = 0

    @oct.chars.map(&:to_i).each_with_index do |num, index|
      decimal += num * 8**(@oct.size - 1 - index)
    end

    decimal
  end

  private

  def valid?
    oct_digits = (0..7).to_a
    @oct.chars.each do |digit|
      return false if digit.to_i.to_s != digit
      return false if !oct_digits.include?(digit.to_i)
    end

    true
  end
end
