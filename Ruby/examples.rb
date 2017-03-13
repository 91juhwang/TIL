a = 'hello world james'
b = a.chars
puts b
puts ''
# .chars returns an array of each letters
# and we use .sort_by, which map and return values using a following block,
# which the block contains the value and the index from .with_index method.
# and we sort_by the last index and returns the .join values
puts a.chars.sort_by.with_index { |x, y| -y }.join

# the initial memo value of x is s, and the enumerating value of y is t.
# .reduce sets the new value for the memo value of x after the operation.
# x now becomes `ts` from t + s, and the memo value of x becomes `ts`.
# with the enumerating value of y, r, it sets the new memo value of x as r + ts.
# then, x = rts, y = i, y + x = irts, which again becomes a new value for x
# x = irts, y = n, y + x = nirts, which again become a new value for x
"string".chars.reduce { |x, y| y + x }
