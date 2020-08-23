 
=begin calculator
 -In a loop, for, while, etc... need to declare 
 variable outside if you want to access later
 -to_i will convert anything that is not
 be able to be converted to numerical values to 0
 to_i("hello") -> 0
 -declare variables with empty string
 and when users put input, they will be replaced
 -heredoc
 -main is the object of Object class,
 Kernel is loaded into this main object
=end

=begin debugging
Steps to debugging
1/Reproduce the Error

2/Determine the Boundaries of the Error --> modify the data to get different
or more or less errors to understand eep problems

3/Trade the code --> example: multiple assignment
make, model = ["car", "model"]

4/Understand the problem well

5/Implement a fix using rescue: rescue false

6/Test the Fix

Tools and Techniques
-Pry: require "pry" --> put binding.pry or debugging where you want the
program to stop
using binding.pry: Ctrl+D for continuing program or type exit-program
to exit debugging
=end

=begin precedence
methods are evaluted first and return values, before the operators are
executed

p(array.map) do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end                                 #  => <Enumerator: [1, 2, 3]:map>

p(array.map { |num| num + 1 })      # [2, 3, 4]
                                    # => [2, 3, 4]

use tap method for debugging -> it passes the calling object into
a block and then return the whole object --> good for debugging
--> in chained methods at every step to see how the entire object changes
=end


