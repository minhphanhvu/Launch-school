def select(array)
  result = []
  counter = -1
  
  while counter < array.size - 1
    counter += 1
    yield(array[counter]) ? result << array[counter] : next
  end

  result
end

array = [1, 2, 3, 4, 5]

p (select(array) { |num| num.odd? })     # => [1, 3, 5]
p (select(array) { |num| puts num })     # => [], because "puts num" returns nil and evaluates to false
p (select(array) { |num| num + 1 })     # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true