class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(num)
    raise ArgumentError if num > @digits.length
    result = []

    num_arr = @digits.split("").map(&:to_i)
    num_arr.each_with_index do |_, index|
      break if index + num > num_arr.size
      result << num_arr.slice(index, num)
    end

    result
  end
end
