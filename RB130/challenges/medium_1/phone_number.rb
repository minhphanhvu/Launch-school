class PhoneNumber
  attr_accessor :str_nums

  def initialize(str_nums)
    @str_nums = str_nums
  end

  def number
    if bad_number?
      self.str_nums = '0000000000'
    elsif str_nums.size == 11
      self.str_nums = str_nums[1..-1]
    else
      self.str_nums = convert
    end
  end

  def area_code
    str_nums[0..2]
  end

  def to_s
    number
    "(" + str_nums[0..2] + ") " + str_nums[3..5] + "-" + str_nums[6..-1]
  end

  private

  def bad_number?
    if convert.size < 10 ||
       convert.size > 11 ||
       str_nums.scan(/[A-Za-z]/).size > 0
      return true
    elsif convert.size == 11 && !convert.start_with?('1')
      return true
    end
    false
  end

  def convert
    str_nums.scan(/\d/).join
  end
end
