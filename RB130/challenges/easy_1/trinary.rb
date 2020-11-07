class Trinary
  def initialize(tri)
    @tri = tri
  end

  def to_decimal
    return 0 if !valid?
    decimal = 0

    @tri.chars.map(&:to_i).each_with_index do |num, index|
      decimal += num * 3**(@tri.size - 1 - index)
    end

    decimal
  end

  private

  def valid?
    tri_digits = (0..4).to_a
    @tri.chars.each do |digit|
      return false if digit.to_i.to_s != digit
      return false if !tri_digits.include?(digit.to_i)
    end

    true
  end
end
