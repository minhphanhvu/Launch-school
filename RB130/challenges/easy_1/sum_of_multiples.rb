class SumOfMultiples
  attr_accessor :set

  def initialize(*arg)
    @set = [*arg]
  end

  def self.to(max_num)
    @set = [3, 5] if @set.nil? || @set == []
    arr = []

    @set.each do |multiple|
      number = multiple
      while number < max_num
        arr << number
        number += multiple
      end
    end

    arr.uniq!
    arr.sum
  end

  def to(max_num)
    @set = [3, 5] if @set.nil? || @set == []
    arr = []

    @set.each do |multiple|
      number = multiple
      while number < max_num
        arr << number
        number += multiple
      end
    end

    arr.uniq!
    arr.sum
  end
end
