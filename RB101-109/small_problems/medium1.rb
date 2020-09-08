require 'byebug'

# p1

def rotate_array(arr)
  arr[1...arr.length] + [arr[0]]
end

p "p1---"
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# p2

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join('').to_i
end

p "p2----"
p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) #== 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) #== 352917

# p3

def rotate_rightmost_digits2(digits, n)
  digits[-n..-1] = rotate_array(digits[-n..-1])
end


def max_rotation(num)
  size = num.to_s.size
  digits = num.to_s.chars
  loop do
    rotate_rightmost_digits2(digits, size)
    size -= 1
    break unless size != 0
  end
  digits.join('').to_i
end

p "p3---"
p max_rotation(735291) #== 321579
p max_rotation(3) == 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# p4

def switch_position(arr)
  result = []
  arr.each_with_index do |value, index|
    result << index + 1 if value
  end
  result
end

def switches(n)
  switches = Array.new(n, false)
  inc = 1
  (0...n).step(1) do |index|
    while index < n
      switches[index] = !switches[index]
      index += inc
    end
    inc += 1
  end
  switch_position(switches)
end

p "p4----"
p switches(5)
p switches(10)
p switches(100)

# p5

def print_line(num, num_dia)
  space = ' ' 
  diamond = '*'
  spaces = (num - num_dia)/2
  puts "#{space*spaces}#{diamond*num_dia}#{space*spaces}" 
end

def diamond(num)
  (1..num).step(2) do |num_dia|
    print_line(num, num_dia)
  end
  (num-2).step(1, -2) do |num_dia|
    print_line(num, num_dia)
  end
end

p "p5---"
diamond(1)
diamond(5)

# p6





