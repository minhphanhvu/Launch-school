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

# def minilang(commands)
#   register = 0
#   commands = commands.split(' ')
#   stack = []
#   commands.each do |command|
#     case command
#     when command.to_i.to_s then register = command.to_i
#     when 'PUSH' then stack << command.to_i
#     when 'ADD' then register += stack.pop
#     when 'SUB' then register -= stack.pop
#     when 'MULT' then register *= stack.pop
#     when 'DIV' then register /= stack.pop
#     when 'MOD' then register %= stack.pop
#     when 'POP' then register = stack.pop
#     when 'PRINT' then puts register
#     end
#   end
# end

# p "p6----"
# p minilang('PRINT')
# # 0
# p minilang('5 PUSH 3 MULT PRINT')
# # 15
# p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
# p minilang('5 PUSH POP PRINT')
# # 5
# p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
# p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
# p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
# p minilang('-3 PUSH 5 SUB PRINT')
# # 8
# p minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# p7
def word_to_digit(string)
  digits = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
           }
  digits.keys.each do |word|
    string.gsub!(/\b#{word}\b/, digits[word])
  end 
  string
end

p "p7----"
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# p8

def fibonacci(num)
  if num == 1
    1
  elsif num == 2
    1
  else
    fibonacci(num-1) + fibonacci(num-2)
  end
end

p "p8---"
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# p9

def fibonacci2(num)
  if num == 1 || num == 2
    return 1
  else
    leading_fibo = 1
    trailing_fibo = 1
    cur_fibo = 1
    check = 2

    while check != num
      cur_fibo = trailing_fibo + leading_fibo
      leading_fibo = trailing_fibo
      trailing_fibo = cur_fibo
      check += 1
    end

  end
  cur_fibo
end

p "p9---"
p fibonacci2(20) #== 6765
p fibonacci2(100) #== 354224848179261915075

# p10

def fibonacci_last(num)
  fibonacci2(num).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4


