# Refactoring

## Remove If and Else statements!!

If and else staments attract dependencies, and becomes hard to maintain as it scales. Bad code smell is detected when if/elsif/else is used. 

We can refactor by using the OOP and some design patterns.

```ruby

```

## Antipattern

Don't use each, instead use iterators like .map, .inject, .reduce

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
```