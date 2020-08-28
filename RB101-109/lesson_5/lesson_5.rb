# problem 1
arr = ['10', '11', '9', '7', '8']

arr.sort! do |a, b|
  b.to_i <=> a.to_i
end

p arr

# problem 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort! do |book1, book2|
  book1[:published].to_i <=> book2[:published].to_i
end

p books

# problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]

p arr2[1][:third][0]

p arr3[2][:third][0][0]

p hsh1["b"][1]

p hsh2[:third].keys[0]

# problem 4

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
p arr1

arr2[2] = 4
p arr2

hsh1[:first][2][0] = 4
p hsh1

hsh2[["a"]][:a][2] = 4
p hsh2

# problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters.values
total_age = 0
munsters.each_value do |infos|
  total_age += infos["age"] if infos["gender"] == "male"
end

p total_age

# problem 6

munsters.keys.each do |person|
  puts ("#{person} is a #{munsters[person]["age"]}-year-old #{munsters[person]["gender"]}.")
end

#problem 7

a = 2 # a.object_id = 5
b = [5, 8] # b.object_id: 200; b[0].object_id = 11; b[1].object_id = 17

arr = [a, b] # arr = [2, [5, 8]]
# arr.object_id: 220; arr[0].object_id = 5; arr[1].object_id = 200

arr[0] += 2 #arr[0] = 4 while a = 2
# arr[0].object_id: 9; a.object_id = 5 --> arr[0] now points to another memory with value of 4 while a still points to a memory with value of 2

arr[1][0] -= a #arr = [4, [3, 8]]
# b.object_id = 200; arr[1].object_id = 200; b[0].object_id = 7; b[1].object_id = 17; arr[1][0].object_id = 7; arr[1][1].object_id = 17
#arr[1][0] points to another memory with value of 3, but since b also points to the whole sub-array, b[0] is forced to point to the same memory arr[1][0] points to

# problem 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, array|
  array.each do |ele|
    ele.each_char do |char|
      if "aeuio".include?(char)
        puts char
      end
    end
  end
end

# problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_array = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end

p arr
p sorted_array

# problem 10

original_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_array = original_array.map do |hash|
  new_hash = {}
  hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

p original_array
p new_array

# problem 11

arr_11 = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_11_sol = arr_11.map do |sub_array|
  sub_array.select do |ele|
    ele % 3 == 0
  end
end

p arr_11
p arr_11_sol

# problem 12

arr_12 = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash_12 = {}
arr_12.each do |sub_array|
  new_hash_12[sub_array[0]] = sub_array[1]
end


p arr_12
p new_hash_12

# problem 13

arr_13 = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr_13.sort_by! do |sub_array|
  sub_array[2]
end

p arr_13

# problem 14

hsh_14 = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

array_14 = hsh_14.map do |key, _|
  if hsh_14[key][:type] == "fruit"
    new_array = hsh_14[key][:colors].map {|color| color.capitalize}
  else
    hsh_14[key][:size].upcase
  end
end

p array_14
p hsh_14

# problem 15

arr_15 = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr_15_sol = arr_15.select do |hsh|
  hsh.all? do |_, value|
    value.all? {|num| num.even?}
  end
end

p arr_15
p arr_15_sol

# problem 16

def uuid_generator
  numbers = [8, 4, 4, 4, 12]
  chars_nums = ("a".."z").to_a + (1..9).to_a
  uuid = ""
  numbers.each do |num|
    num.times do 
      uuid += chars_nums.sample.to_s
    end
    uuid += "-"
  end
  uuid[-1] = ""
  uuid
end

p uuid_generator