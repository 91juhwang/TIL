# Dec. 28. 2016
# Implement a method that accepts 3 integer values a, b, c.
# The method should return true if a triangle can be built
# with the sides of given length and false in any other case.
# In this case, all triangles must have surface greater than 0 to be accepted.

def isTriangle(a, b, c)
  a, b, c = [a, b, c].sort
  a + b > c
end
p isTriangle(4, 2, 3)

# Dec-29-2016
# Given an array, find the int that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.

def find_it(seq)
  seq.each do |e|
    a = seq.count(e)
    e if (a % 2).odd?
  end
end
p find_it([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5])

# Dec-30-2016
# Write a function that takes an (unsigned) integer as input, and
# returns the number of bits that are equal to one
# in the binary representation of that number.
# Example: The binary representation of 1234 is 10011010010,
# so the function should return 5 in this case

def count_bits(n)
  a = n.to_s(2).count '1'
  p "answer for count_bits of #{n} is #{a}"
end
count_bits(10)
count_bits(1234)

# Jan-04-2017
# Complete the findNextSquare method
# that finds the next integral perfect square
# after the one passed as a parameter.
# Recall that an integral perfect square is an integer n
# such that sqrt(n) is also an integer.
# If the parameter is itself not a perfect square,
# then -1 should be returned. You may assume the parameter is positive.

def find_next_square(sq)
  # Return the next square if sq is a perfect square, -1 otherwise
  number = Math.sqrt(sq) + 1
  (number % 1).zero? ? number**2 : -1
end

p find_next_square(81)
p find_next_square(1234)

# Jan-05-2017
# an invalid sequence (a string with non numeric character) must return 1
# a complete (or empty) sequence must return 0;
# a broken sequence with more than one number missing
# should return the lowest missing number;
# otherwise return the missing number.

def find_missing_number(sequence)
  p '--- Jan-05-2017 problem -----'
  # non-numeric characters will be 0
  seq = sequence.split.map(&:to_i).sort
  p seq
  # Assigin the starting index at 1
  # will return 1 if it contains 0 (non-numerics)
  seq.each.with_index(1) do |e, i|
    p "index is #{i} and e is #{e}"
    return i unless e == i
  end
  # return 0 if it all passes
  0
end
p find_missing_number('1 2 3 aa 5')
p find_missing_number('1 2 3 34 5 9')

# Jan-06-2017
# Write a function that returns both the
# minimum and maximum number of the given list/array.

def min_max(lst)
  p '--- Jan-06-2017 problem ---'
  # you can also do lst.minmax
  [lst.min, lst.max]
end
p min_max([1, 2, 3, 4, 5])

# Jan-06-2017
# with the one letter array like ['n', 's', 'e', 'w']
# each represent north,south,east, west.
# each block takes 1 minute to travel
# return true if it takes exactly 10 mintues
# must come back to the starting point! ex.if 3 north, then 3 south expected
def is_valid_walk(walk)
  p '--- Jan-06-2017 problem --- '
  count_ns = walk.count('n') == walk.count('s')
  count_ew = walk.count('e') == walk.count('w')
  if walk.count == 10 && count_ns == true && count_ew == true
    true
  else
    false
  end
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])
p is_valid_walk(['n','s','n','s','n','s','n','s','n','s', 's'])
p is_valid_walk(['n','s','n','s','n','s','n','s','n', 'e'])

# Jan-09-2017
# A Narcissistic Number is a number which is the sum of its own digits,
# each raised to the power of the number of digits.
# 153: 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
# 1634: 1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634

def narcissistic?(value)
  p '--- Jan-09-2017 problem --- '
  length = value.to_s.length.to_i
  calculated = value.to_s.split('').map(&:to_i).map { |e| e**length }.reduce(:+)
  # calculated == value
  # Below is the ideal code
  value == value.to_s.chars.map { |x| x.to_i**value.to_s.size }.reduce(:+)
end

p narcissistic?(153)
p narcissistic?(154_545)

# Jan-10-2017
# A digital root is the recursive sum of all the digits in a number.
# Given n, take the sum of the digits of n.
# If that value has two digits, continue reducing in this way
# until a single-digit number is produced.

def digital_root(n)
  p '--- Jan-09-2017 problem2 --- '
  n = n.to_s.chars.map(&:to_i).reduce(:+) until n < 10
  n
end

p digital_root(11)
p digital_root(942)

# Jan-10-2017
# check for closing brackets and paranethesis

def group_check(s)
  p '--- Jan-10-2017 problem --- '
  stack = []
  symbols = { '{' => '}', '[' => ']', '(' => ')' }
  s.each_char do |c|
    p 'c is ' + c
    p 'symbols.key? = ' + symbols.key?(c).to_s
    stack << c if symbols.key?(c)
    p 'symbols.key = ' + symbols.key(c).to_s
    p stack
    return false if symbols.key(c) && symbols.key(c) != stack.pop
  end
  stack.empty?
end

p group_check('[][][][][]')
p group_check('[{[{}]}]')
p group_check('{(})')

# Jan-10-2017
# Implement the function unique_in_order which takes as argument
# a sequence and returns a list of items without any elements
# with the same value next to each other
# and preserving the original order of elements.

def unique_in_order(iterable)
  p '--- Jan-10-2017 problem --- '
  arry = []
  iterable.each_char do |c|
    arry << c
  end
end

p unique_in_order("ABCDUIBadsfbidfB")
p unique_in_order("ABCDEBBB")

# Real life challenge from MSS2 project. 
# From the api calls, @listings returns arrays of hashes
# From the JSON data, parsed it to strings
# challenge is to get the total amount of rent_price and display in erb. 
# Below is what I came up with 

# @listings.map { |listing| listing[:rent_price].gsub(/,/, '').to_i }.inject(&:+).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
# 1. Iterate all the rent_price in the listings
# 2. Remove the commas from the string of rent_price
# 3. Convert it to integers and add all of them using inject()
# 4. Change back to the strings, and reverse it to add the commas, 
# 5. Regex => For every 3rd digits, if it is a digit, place the comma after
# 6. Reverse it back to display the final result

# Complete the solution so that it reverses 
# all of the words within the string passed in.
def solution(sentence)
  sentence.split.reverse.join(" ")
end
p solution("The greatest victory is that which requires no battle")

# Find the first non-repeating letter
def first_non_repeating_letter(s) 
  counts = Hash.new(0)
  s.split("").reduce(counts) { |k, v| k[v] += 1; k}
  p counts
  counts.key(1).nil? ? "" : counts.key(1)
end

p first_non_repeating_letter("stress")
p first_non_repeating_letter("sTRtresDFASATs")