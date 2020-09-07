# p1

def sum_of_sums(array)
  result = 0
  sum = 0
  array.each do |num|
    sum += num
    result += sum
  end
  result
end

p "p1---"
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# p3

def leading_substrings(string)
  result = []
  string.size.times do |index|
    result << string[0..index]
  end
  result
end

p "p3----"
p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# p4
def substrings(string)
  new_array = []
  string.size.times do |index|
    new_array << leading_substrings(string[index..string.size])
  end
  new_array.flatten
end

p "p4---"
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# p5

def is_palindrome?(string)
  string == string.reverse && string.size >= 2
end

def palindromes(string)
  substrings(string).select { |sub_str| is_palindrome?(sub_str) }
end

p "p5----"
p palindromes('abcd') == []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') #== [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# p6
def fizzbuzz(num1, num2)

end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz