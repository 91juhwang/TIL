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