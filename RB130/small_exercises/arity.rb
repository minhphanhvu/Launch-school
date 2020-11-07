# Group 1
p "Group 1"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# use proc to define a Proc object, same way as Proc.new
# method call invoked on proc object. Arguments that are passed from the method 'call' will be 
# referenced by the parametered defined by the proc.

# if no arguments passed, parameters point to nil

puts
p "Group 2"
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call('cat')
my_third_lambda = lambda { |thing| puts "This is a #{thing}." }

# lambda must provide arguments for method 'call'. if not, error is raised

# cannot create a lambda with Lambda.new

puts 
p "Group 3"
# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal') { nil }

# yield enforces a block provided
# use block_given? for optional blocks

puts 
p "Group 4"
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { |animal| puts "This is a #{animal}."}