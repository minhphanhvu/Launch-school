class PhoneNumber
  attr_accessor :str_nums

  def initialize(str_nums)
    @str_nums = str_nums
  end

  def number
    convert_nums = convert
    convert_nums.size == 10 ? self.str_nums = convert_nums : self.str_nums = '0000000000'
  end

  def to_s
    str_nums
  end

  private

  def convert
    str_nums.scan(/\d/).join
  end
end