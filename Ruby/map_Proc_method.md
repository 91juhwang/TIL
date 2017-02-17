# Understanding Ruby's idiom: array.map(&:method)

## Problem

When working on MSS2 development, I had to retrieve the correct data by going through the hashes that contained another JSON hash with a key "Listings." Even though, I solved a problem for my specific development, I wanted to learn more about the amazing proc and .map() method that is used widely in Ruby, 

## Solve
My code to the problem was something like this

```ruby
@exclusive_listings = Agent.all.to_a.map(&:listings).flatten.uniq
```

This code turns JSON objects to an array, then goes through a hash to collect the arrays of listings. 
Used Flatten to take the external array that wraps the data, and 
used Uniq to retrieve only the unique values in the array. 

## .map()

- `map()` is used to execute a block of code for each element. 
- Example: 
```ruby 
class Foo
  def method_name
    puts "method called for #{object_id}"
  end
end

[Foo.new, Foo.new].map do |element| 
  element.method_name
end

# => method called for 70339841711300
# => method called for 70339841711280
```
this is basically samething as below. Both are calling method_name() to each element in the array.

```ruby
[Foo.new, Foo.new].map(&:method_name)
```
## Proc, &

- When ruby sees &, it calls `to_proc()`
- you can move around this method to customize it as you want

```ruby
class MyClass
  def to_proc
    puts "trying to convert to a proc"
    Proc.new {}
  end
end

[].map(&MyClass.new)

# => trying to convert to a proc
```