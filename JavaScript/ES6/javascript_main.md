# JavaScript Fundamentals

# Style Guide
[Style Guide](https://github.com/feross/standard/blob/master/RULES.md#automatic-semicolon-insertion-asi)

# Useful Tutorials
[React+Redux Tutorial](https://reactjs.co/#basic-preface)
[Promises Explanation](http://www.datchley.name/es6-promises/) 

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

### .reduce advanced!!!
  * [Link to the advanced .reduce lesson](https://www.youtube.com/watch?v=1DMolJ2FrNY)

### Closures
The function body has accces to variables that are outside of the function. Closure allows the out of scope variables. The out of scope variable in the function is called, when the function is executed. Works similar to objects in OOP. 

### Currying
When a function doesn't take all the arguments up front and returns a function. Currying is useful because you are allowed to save the top-levle functino into a variable for one thing, then set it to another variable for the return function for the other thing. Making a currying function is basically decoupling a big one chunk funciton. 

```javascript
var orders = [
  { amount: 300, element: 'heyasdfaf' },
  { amount: 100, element: 'heyaaa' },
  { amount: 200, element: 'heysadf' },
  { amount: 400, element: 'hi' },
  { amount: 500, element: 'hi' }
]
let hasElement = (element, obj) => obj.element === element
let dragons = orders.filter(x => hasElement('hi', x))
console.log(dragons) // returns [ { amount: 400, element: 'hi' }, { amount: 500, element: 'hi' } ]

// Improve with Currying!
import _ from 'loadash' // javascript library, fork from underscore, but better
let hasElement = _.curry((element, obj) => obj.element === element)
let dragons = orders.filter(hasElement('hi'))
console.log(dragons) // returns [ { amount: 400, element: 'hi' }, { amount: 500, element: 'hi' } ]
```

### Recursion
Function calls function
```javascript
let countDownFrom = (num) => {
  if (num === 0) return
  console.log(num)
  countDownFrom(num -1) 
}
countDownFrom(10) // console.log from 10, 9, 8, ... until 1
```

### Promises
Promises are composable unlike callback functions. When it comes async success/failure, you want something like this. 
```javascript
img1.callThisIfLoadedOrWhenLoaded(function() {
    // loaded
}).orIfFailedCallThis(function() {
    // failed
});

// and…
whenAllTheseHaveLoaded([img1, img2]).callThis(function() {
  // all loaded
}).orIfSomeFailedCallThis(function() {
  // one or more failed
});
```
Promises deliver same thing as above, but with better naming. With HTML image elements had a `ready()`method, 
```javascript
img1.ready().then(function() {
  // loaded
}, function() {
  // failed
});

// and…
Promise.all([img1.ready(), img2.ready()]).then(function() {
  // all loaded
}, function() {
  // one or more failed
});

```
  * A promise can only succeed or fail once. It cannot succeed or fail twice, neither can it switch from success to failure or vice versa.
  * If a promise has succeeded or failed and you later add a success/failure callback, the correct callback will be called, even though the event took place earlier.
This is extremely useful for async success/failure, because you're less interested in the exact time something became available, and more interested in reacting to the outcome.
```javascript
var promise = new Promise(function(resolve, reject) {
  // do a thing, possibly async, then…

  if (/* everything turned out fine */) {
    resolve("Stuff worked!");
  }
  else {
    reject(Error("It broke"));
  }
});

// Below is how to use the promise
promise.then(function(result) {
  console.log(result); // "Stuff worked!"
}, function(err) {
  console.log(err); // Error: "It broke"
});
```
#### Refer the above link for explanation!!


