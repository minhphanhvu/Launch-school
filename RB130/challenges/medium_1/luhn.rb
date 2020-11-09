class Luhn
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def addends
    result = []
    num_string = num.to_s
    index = -1
    check_point = -num_string.size - 1

    while index != check_point
      result << convert_number(index, num_string[index].to_i)
      index -= 1
    end
    result.reverse!
  end

  def checksum
    sum = addends.sum
  end

  def valid?
    return true if checksum % 10 == 0
    false
  end

  def self.create(num)
    object = Luhn.new(num)
    10.times do |digit|
      object.num = (object.num.to_s + digit.to_s).to_i
      return object.num if object.valid?
      object.num /= 10
    end
  end

  private

  def convert_number(index, number)
    if !index.even?
      number
    elsif number * 2 >= 10
      number * 2 - 9
    else
      number * 2
    end
  end
end
