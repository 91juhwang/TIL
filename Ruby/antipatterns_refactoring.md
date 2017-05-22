# Refactoring

## Antipattern


### Remove If and Else statements!!

If and else staments attract dependencies, and becomes hard to maintain as it scales. Bad code smell is detected when if/elsif/else is used. 

We can refactor by using the OOP and some design patterns.

```ruby

```


### Iteration

Don't use each, instead use iterators like .map, .inject, .reduce, .reject, .select etc..

```ruby
params['xmlfeed']['listing_id'].inject([]) do |result, id|
  result << { id => Date.today.to_s }
end

params['xmlfeed']['listing_id'].inject({}) do |result, id|
  result.merge(id: Date.today.to_s)
end

def addition_and_delimeter(string)
  string.map(&:to_i).inject(&:+)
end

def addition_and_delimeter(string)
  string.map(&:to_i).reduce(&:+)
end

[13, 4, 505, 12].reject { |n| n > 500} # [13, 4, 12] }
[13, 4, 505, 12].select { |n| n > 500} # [ 505 ] }
```
