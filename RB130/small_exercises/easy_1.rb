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
# p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute

# p5
p "p5---"

def decipher(enc_string)
  # just move forward 13 more moves to get back to the original letter
  original = ""
  enc_string.each_char do |char|
    if char.ord >=65 && char.ord <= 90
      original += ((char.ord - 65 + 13) % 26 + 65).chr
    elsif char.ord >= 97 && char.ord <= 122
      original += ((char.ord - 97 + 13) % 26 + 97).chr
    else
      original += char
    end
  end
  original
end

p decipher('Nqn Ybirynpr')
p decipher('Tenpr Ubccre')
p decipher('Nqryr Tbyqfgvar')
p decipher('Nyna Ghevat')
p decipher('Puneyrf Onoontr')
p decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decipher('Wbua Ngnanfbss')
p decipher('Ybvf Unvog')
p decipher('Gvz Orearef-Yrr')
p decipher('Fgrir Jbmavnx')

# p6
p "p6---"

def any?(array)
  counter = 0
  while counter < array.size
    return true if yield(array[counter])
    counter += 1
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# p7
p "p7---"

def all?(array)
  counter = 0

  while counter < array.size
    return false if !yield(array[counter])
    counter += 1
  end

  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

# p8
p "p8---"

def none?(array)
  counter = 0

  while counter < array.size
    return false if yield(array[counter])
    counter += 1
  end

  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# p9
p "p9---"

def one?(array)
  counter = 0
  count = 0
  while counter < array.size
    count += 1 if yield(array[counter])
    counter += 1
  end

  return true if count == 1
  false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false

# p10
p "p10---"

def count(array)
  counter = 0
  count = 0
  while counter < array.size
    count += 1 if yield(array[counter])
    counter += 1
  end

  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2