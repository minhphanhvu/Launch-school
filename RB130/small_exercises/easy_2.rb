# p1
p "p1---"

def step(starting, ending, step_value)
  array = []

  while starting <= ending
    array << starting
    yield(starting)
    starting += step_value
  end

  array
end

p (step(1, 10, 3) { |value| puts "value = #{value}" })

#p2
p "p2---"

def zip(arr1, arr2)
  result = []

  arr1.each_with_index do |num, index|
    result << [num, arr2[index]]
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

#p3
p "p3---"

