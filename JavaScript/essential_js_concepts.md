# JavaScript Fundamentals

## Higher Order Functions

Functions are values. Functions can be assigned to variables. 
**It can also be passed into different functions.** Just as below.

```javascript
var triple =  function(x) {
    return x * 3
  }
var waffle = triple
waffle(30)
```

### .Filter
One of the most used higher order function is `.filter`. see the below example.

#### Example: 
```javascript
// Goal is to filter out human kind only
var animals = [ 
  {name: 'james', kind: 'animal'},
  {name: 'james2', kind: 'human'},
  {name: 'james3', kind: 'human'},
  {name: 'james4', kind: 'animal'},
  {name: 'james5', kind: 'animal'}
]
// using normal for loop
var humans = []
for (var i = 0; i < animals.length; i++) {
  if (animals[i].species === 'human') {
    humans.push(animals[i])
  }
}
// Using the filter function
var humans2 = animals.filter(function(animal) {
  return animal.kind === 'human'
})
```
In the above exmple, function insde the filter function is called `callback function`. Filter function will loop through the animals, and callback function will be applied to each element in an array. And returns the new array.
This is useful because we can **decouple** the logic for debugging, maintaining, and scaling the software. such as:
```javascript
var isHuman = function(human) {
  return human.kind === 'human'
}
var humans2 = animals.filter(function(human))
// returns the same result, but much more clean and decoupled two logics
```

### .Map
```javascript
// returns names
var names = animals.map(function(animal) {
  return animal.map
})
// Using es6
var nameEs6 = animals.map((x) => x.name )
```

### .Reduce
.reduce takes a callback function as a first argument, and the order for the second argument.
#### Example:
```javascript
var orders = [
  { amount: 300 },
  { amount: 100 },
  { amount: 200 },
  { amount: 400 },
  { amount: 500 }
]
var total = orders.reduce(function(accu, order) => 
  accu + order.amount
}, 0)
```
The `sum` takes the initial value(accumulator) from the second argument of the `reduce` function, and loops through the order and adds `order.amount` to get the total amount. It's like Ruby's method .reduce.
```ruby
# x is the accumulator, and y is the value
# s is the x, t is the y
# y + x = ts = new x
# returns 'gnirts'
'string'.chars.reduce { |x, y| y + x }
```

