# p1
p "p1---"

class Tree
  include Enumerable

  def each
  end
end

# p2
p "p2---"

def compute
  if block_given?
    return yield
  end
  "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# p3
p "p3---"

def missing(array)
  counter1 = 0
  num = array[0]
  result = []

  while array[counter1] != nil
    if array[counter1] == num
      counter1 += 1
      num += 1
    else
      result << num
      num += 1
    end
  end

  result
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []

# p4
p "p4---"

def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute