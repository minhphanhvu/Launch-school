require 'byebug'

# p1

def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

p "p1----"
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

# p2

def is_double?(num)
  if !num.to_s.size.even?
    false
  else
    total_size = num.to_s.size
    half_size = total_size/2
    num.to_s[0..(half_size-1)] == num.to_s[half_size...total_size]
  end
end

def twice(num)
  if is_double?(num)
    num
  else
    num*2
  end
end

p "p2----"
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) #== 3333
p twice(7676) #== 7676
p twice(123_456_789_123_456_789) #== 123_456_789_123_456_789
p twice(5) == 10

# p3

def negative(num)
  num <= 0 ? num : -num
end

p "p3----"
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# p4

def sequence(num)
  new_arr = []
  (1..num).step(1) { |n| new_arr << n }
  new_arr
end

p "p4----"
p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]

# p5

def uppercase?(string)
  string.upcase == string
end

p "p5---"
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# p6

def word_lengths(string)
  string.split(' ').map do |word|
    word + ' ' + word.size.to_s
  end
end

p "p6---"
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# p7

def swap_name(name)
  name = name.split(' ')
  name[1] + ", #{name[0]}"
end

p "p7----"
p swap_name('Joe Roberts') == 'Roberts, Joe'

# p8

def sequence(count, num)
  arr = []
  (1..count).step(1) do |time|
    arr << time*num
  end
  arr
end

p "p8---"
p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# p9
def get_grade(score1, score2, score3)
  ave = (score1 + score2 + score3)/3
  case ave
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) #== "A"
p get_grade(50, 50, 95) == "D"

# p10

def buy_fruit(arr)
  fruits = []
  arr.each do |sub_array|
    sub_array[1].times do |_|
      fruits << sub_array[0]
    end
  end
  fruits
end

p "p10---"
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]