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

# p7

def repeater(string)
  new_string = ""
  string.each_char { |char| new_string << char*2 }
  new_string
end

p "p7---"
p repeater('Hello') #== "HHeelllloo"
p repeater("Good job!") #== "GGoooodd  jjoobb!!"
p repeater('') #== ''

# p8

def double_consonants(string)
  new_string = ""
  alphabet = ("a".."z").to_a + ("A".."Z").to_a
  vowels = "aeuioAEUIO"
  string.each_char do |char|
    if !alphabet.include?(char) || vowels.include?(char)
      new_string << char
    else 
      new_string << char*2
    end
  end
  new_string
end

p "p8----"

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# p9
def reversed_number(num)
  num.to_s.reverse.to_i
end

p "p9----"
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# p10

def center_of(string)
  if string.size.odd?
    string[string.size/2]
  else
    string[(string.size/2-1)..string.size/2]
  end
end

p "p10----"
p center_of('I love ruby') #== 'e'
p center_of('Launch School') == ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') == 'x'