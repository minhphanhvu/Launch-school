require 'byebug'
# p1 cute angle

def dms(degree)
  degrees, decimals = degree.divmod(1)
  minutes, decimals = (decimals*60).divmod(1)
  seconds = decimals*60/1.round(0)
  format("#{degrees}\xC2\xB0%02d'%02d\"", minutes, seconds)
end

p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) #== %(0°00'00")
p dms(360) #== %(360°00'00") || p dms(360) == %(0°00'00")

# p2 
def remove_vowels(array)
  vowels = "aeuioAEUIO"
  array.map! { |word| word.delete(vowels) }
end
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))# == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white))# == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']

# p3
def num_length(num)
  num.to_s.length
end

def find_fibonacci_index_by_length(num_of_digits)
  first_fibo = 1
  second_fibo = 1
  index = 2
  
  loop do
    temp = first_fibo
    first_fibo = second_fibo
    second_fibo = temp + first_fibo
    index += 1
    break if num_length(second_fibo) == num_of_digits
  end
  index
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
#p find_fibonacci_index_by_length(10000) #== 47847

# p4 ``

def reverse!(array)
  half_length = array.length/2
  len = array.length - 1
  index = 0

  while index < half_length
    array[index], array[len - index] = array[len-index], array[index]
    index += 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result #== [4, 3, 2, 1]
p list #== [4, 3, 2, 1]
p list.object_id == result.object_id
p "----"
list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
p "----"
list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
p "----"
list = []
p reverse!(list) #== []
p list #== []

# p5

def reverse(array)
  len = array.length-1
  array.each_with_index.map { |_, index| array[len-index]}
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
p "----"
# p6

def merge(array1, array2)
  (array1 + array2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# p7

def halvsies(array)
  middle = (array.length/2.0).ceil
  first = array[0, middle]
  second = array[middle, array.length - middle]
  [first,second]
end

p "----"
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# p8

def find_dup(array)
  array.tally.select { |_, value| value == 2 }.keys[0]
end

p"p8--"
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# p9

def include?(array, num)
  array.any? { |element| element == num }
end

p "p9---"
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# p10

def triangle(num)
  num.times do |number|
    number += 1 
    puts " "*(num - number) +"*"*number
  end
end
triangle(5)