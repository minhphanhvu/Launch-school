require 'byebug'

# p1

def program_madlib
  text = File.read('text1.txt')

  adjectives = %w(sleepy beautiful wonderful lazy noisy)
  verbs = %w(bites jumps sleeps runs walks)
  nouns = %w(dog cat lizard person child adult car)
  adverbs = %w(strongly happily fast sadly)

  text = text.split(/\r\n/)

  text.each do |line|
    puts format(line, noun: nouns.sample, verb: verbs.sample, adjective: adjectives.sample, adverb: adverbs.sample)
  end
end

# program_madlib

# p2

def star(num)
  half = num/2
  trailing = num - 1
  line = Array.new(num, ' ')
  line[half] = '*'

  index = 0
  half.times do |_|
    line1 = line.clone
    line1[index] = '*'
    line1[trailing - index] = '*' 
    p line1.join('')
    index += 1
  end
  p Array.new(num, '*').join('')

  index -= 1
  half.times do |_|
    line1 = line.clone
    line1[index] = '*'
    line1[trailing - index] = '*' 
    p line1.join('')
    index -= 1
  end
end

p "p2----"
star(7)
#star(9)

# p3 p4

def transpose(matrix)
  row_size = matrix.size
  column_size = matrix[0].size
  new_matrix = Array.new(column_size) { Array.new(row_size) }

  matrix.each_with_index do |row, index_row|
    row.each_with_index do |ele, index_col|
      new_matrix[index_col][index_row] = ele # exchange colum and row indexes
    end
  end

  new_matrix
end

p "p3--p4----"
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) #== [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) #==
  #[[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) #== [[1]]

# p5

def rotate90(matrix) # first row becomes last column, last row becomes first column
  row_size = matrix.size
  column_size = matrix[0].size
  new_matrix = Array.new(column_size) { Array.new(row_size) }

  column = row_size - 1
  matrix.each_with_index do |row, _|
    row.each_with_index do |ele, index_col|
      new_matrix[index_col][column] = ele
    end
    column -= 1
  end

  new_matrix
end

p "p5----"
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8] # row 1, loop element from 0 1 2 3
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# p6

def my_method(array)
  if array.empty?
    []
  elsif array.size != 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p "p6---"
p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# p7

def merge(arr1, arr2)
  sorted_arr = []
  left_size = arr1.size
  right_size = arr2.size
  left = 0
  right = 0

  if arr1.empty?
    return arr2
  elsif arr2.empty?
    return arr1
  end

  loop do
    if arr1[left] < arr2[right]
      sorted_arr << arr1[left]
      left += 1
    else
      sorted_arr << arr2[right]
      right += 1
    end
    break if left == left_size || right == right_size
  end

  if left == left_size
    sorted_arr += arr2[right..right_size - 1]
  else
    sorted_arr += arr1[left..left_size - 1]
  end

  sorted_arr

end

p "p7---"
p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) #== [1, 4, 5]
p merge([1, 4, 5], []) #== [1, 4, 5]

# p8

def merge1(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end
p "p8---merge1"
p merge1([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
p merge1([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge1([], [1, 4, 5]) #== [1, 4, 5]
p merge1([1, 4, 5], []) #== [1, 4, 5]

def merge_sort(array)
  if array.size == 1
    return array
  end

  arr1 = merge_sort(array[0...(array.length/2)])
  arr2 = merge_sort(array[(array.length/2)..-1])

  return merge1(arr1, arr2)
end

p "p9---"
p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# p10

def egyptian(rat_num)
  result = []
  deno = 1
  sum = 0

  loop do
    if (sum + Rational(1, deno)) <= rat_num
      sum += Rational(1, deno)
      result << deno
      deno += 1
    else
      deno += 1
    end
    break if sum == rat_num
  end

  result
end

def unegyptian(array)
  rat_num = 0
  array.each do |deno|
    rat_num += Rational(1, deno)
  end
  rat_num
end

p "p10----"
p egyptian(Rational(1,2)) # [2]
p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)