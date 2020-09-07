# p1

def interleave(arr1, arr2)
  new_array = []
  arr1.each_with_index do |ele, index|
    new_array << ele
    new_array << arr2[index]
  end
  new_array
end

p "p1---"
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# p2

def letter_case_count(string)
  lower_chars = ("a".."z").to_a
  upper_chars = ("A".."Z").to_a
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each_with_object(hsh) do |char, hsh|
    if lower_chars.include?(char)
      hsh[:lowercase] += 1
    elsif upper_chars.include?(char)
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
end

p "p2---"
p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') #== { lowercase: 0, uppercase: 0, neither: 0 }

# p3

def word_cap(string)
  string.split(' ').map { |word| word.capitalize }.join(' ')
end

p "p3----"
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# p4

def swapcase(string)
  string.chars.map do |char|
    if char.upcase == char
      char.downcase
    else
      char.upcase
    end
  end.join('')
end

p "p4---"
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# p5

def staggered_case(string)
  string.chars.each_with_index.map do |char, index|
    if index.even?
      char.upcase
    else
      char.downcase
    end
  end.join('')
end

p "p5---"
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# p6

p "p6----"

def staggered_case2(string)
  count = -1
  alphabet = ("a".."z").to_a + ("A".."Z").to_a
  string.chars.map do |char|
    if alphabet.include?(char)
      count += 1
      count.even? ? char.upcase : char.downcase
    else
      char
    end
  end.join('')
end

p "p6----"
p staggered_case2('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') #== 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'

# p7

def show_multiplicative_average(array)
  result = array.inject { |mul, ele| mul * ele}
  result = (result*1.0/(array.size))
  result = format("%.3f", result)
  puts "The result is #{result}"
end

p "p7---"
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# p8

def multiply_list(array1, array2)
  array1.zip(array2).map { |sub_arr| sub_arr.reduce(:*) }
end

p "p8----"
p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

# p9

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |sub_arr| sub_arr.reduce(:*) }.sort
end

p "p9---"
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

# p10

def penultimate(string)
  string.split(' ')[-2]
end

p "p10---"
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'