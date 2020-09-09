require 'byebug'
require 'date'

# p1

# def longest_sentence
#   read_file = File.read('text.txt')
#   sentences = read_file.split(/\!|\?|\./)
#   longest_sentence = sentences.max_by { |sentence| sentence.split.size }
#   longest_size = longest_sentence.size
#   puts "#{longest_sentence}"
#   puts "has #{longest_size} words"
# end

# p2 

def block_word?(word)
  test_word = word.upcase
  blocks = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

  blocks.each do |block|
    if test_word.upcase.include?(block[0]) && test_word.upcase.include?(block[1])
      return false
    end
  end
  true
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true


# p3

def letter_percentages(string)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  lowercase = ("a".."z").to_a
  uppercase = ("A".."Z").to_a
  total = string.size
  string.each_char do |char|
    if lowercase.include?(char) 
      hsh[:lowercase] += 1
    elsif uppercase.include?(char)
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end

  hsh.each do |cases, freq|
    hsh[cases] = freq*1.0/total*100
    if hsh[cases] == hsh[cases].to_s.to_i
      hsh[cases] = hsh[cases].round(0)
    else
      hsh[cases] = hsh[cases].round(1)
    end
  end
  hsh
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# p4

def balanced?(string)
  count = 0
  string.each_char do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end
    return false if count < 0
  end 
  if count != 0
    return false
  end
  true
end


p "p4----"
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# p5

def triangle(side1, side2, side3)
  arr = [side1, side2, side3]
  if arr.min(2).sum <= arr.max
    :invalid
  elsif side1 == side2 && side2 == side3
    :equilateral
  elsif side1 == side2 || side2 == side3 || side3 == side1
    :isosceles
  else
    :scalene
  end
end

p "p5----"
p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid


# p6

def triangle2(side1,side2,side3)
  sides = [side1, side2, side3]
  if sides.sum != 180 || !sides.all? { |angle| angle > 0 }
    :invalid
  elsif sides.one? { |angle| angle == 90 }
    :right
  elsif sides.one? { |angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end

p "p6----"
p triangle2(60, 70, 50) #== :acute
p triangle2(30, 90, 60) #== :right
p triangle2(120, 50, 10) #== :obtuse
p triangle2(0, 90, 90) #== :invalid
p triangle2(50, 50, 50) #== :invalid

# p7

def friday_13th(year)
  date = Date.new(year, 1, 13)
  count = 0
  12.times do |_| 
    count +=1 if date.friday?
    date = date.next_month
  end
  count
end

p "p7---"
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# p8

def is_featured?(num)
  num % 7 == 0 && num.odd? && num.to_s.chars.uniq! == nil
end

def featured(num)
  num += 1
  num += 1 until num % 7 == 0 && num.odd? 

  loop do
    if is_featured?(num)
      return num
    else
      num += 7
    end
    break if num >= 9_876_543_210
  end

  "There is no possible number that fulfills those requirements."
end 

p "p8----"
p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
#p featured(999_999_987) #== 1_023_456_987

#p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# p9
def bubble_sort!(array)
  swap = false
  restrict = array.length - 1 # index of the last element

  (array.length-1).times do 
    array.each_with_index do |_, index|
      break if index == restrict # optimization for the tail elements as well as avoiding "out-of-index exception"
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swap = true
      end
    end

    break if !swap

    swap = false # reset swap to false to check the next time if something is swapped
    restrict -= 1 # tail elements restricted for optimization
  end
  array
end

p "p9---"
array = [5, 3]
bubble_sort!(array)
p array #== [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array #== [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# p10

def sum_square_difference(num)
  arr = (1..num).to_a
  sum1 = arr.sum ** 2
  sum2 = arr.inject { |sum, number| sum + number**2 }
  sum1 - sum2
end

p "p10----"
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150