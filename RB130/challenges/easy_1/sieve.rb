class Sieve
  def initialize(max_num)
    @max_num = max_num
  end

  def primes
    b_array = Array.new(@max_num, true)
    result = []

    b_array.each_with_index do |bool, index|
      next if bool == false
      next if index == 0 || index == 1
      result << index
      counter = index

      while counter <= @max_num
        b_array[counter] = false
        counter += index
      end
    end

    result
  end
end
