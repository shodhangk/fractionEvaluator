 <!--Write a command-line program that takes operations on fractions as input and produces a fractional result.
The command-line program shall repeatedly prompt the user for input and display the result until user types "exit".
Legal operators shall be *,  /,  +,  - (multiply, divide, add, subtract).
Operands and operators shall be separated by one or more spaces.
Mixed numbers shall be represented by whole&numerator/denominator; for example, "3&1/4", “-1&7/8”.
Improper fractions, whole numbers, and negative numbers are allowed as operands. -->

#Steps to run the program

1. Install Readline 
    `gem 'readline', '~> 0.0.3'`
2. Start the command line tool: \
    `ruby ruby_cmd.rb`  

#Steps to run test cases
1. Install test unit case gem
    `gem install test-unit -v 3.1.8`
2. Run the all test cases
    `ruby test/test_all.rb`
