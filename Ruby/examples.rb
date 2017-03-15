# .chars returns an array of each letters
# and we use .sort_by, which map and return values using a following block,
# which the block contains the value and the index from .with_index method.
# and we sort_by the last index and returns the .join value
def reverse_string(str) 
  str.chars.sort_by.with_index { |_x, y| -y }.join
end
puts reverse_string('Programming is so fun!!')

# the initial memo value of x is s, and the enumerating value of y is t.
# .reduce sets the new value for the memo value of x after the operation.
# x now becomes `ts` from t + s, and the memo value of x becomes `ts`.
# with the enumerating value of y, r, it sets the new memo value of x as r + ts.
# then, x = rts, y = i, y + x = irts, which again becomes a new value for x
# x = irts, y = n, y + x = nirts, which again become a new value for x
def reverse_str(str)
  str.chars.reduce { |acc, elem| elem + acc }
end
puts reverse_str('Programming is so fun!!')

# Using your preferred language, please create an input array and then write a function to return the second smallest element in that array. For example: an input of {42, 8, 13, 79, 5, 2, 18} should return 5. *

def second_smallest(arry)
  arry.sort[1]
end
puts second_smallest([42,8,6,5,4,23,2,6,124,34])

# without using builtin #sort method
def second_element(arry)
  arry.reduce { |x, y| x - y ? x : y }
end
puts second_element([42,8,6,5,4,23,2,6,124,34])