# ES6

## Arrow functions

Typical use case for the arrow functions is with the scoping. 
Consider the below js. 

```javascript
var deliver = {
  name: "james"

  hadnleMessage: function(message, hangler) {
    handler(message)
  },

  receive: function() {
    var that = this

    this.handleMessage("Hello", function(message){
      that.name
      console.log(message, that.name)
    })
  }
}
deliver.receive()
```
This code is rigorously long, and have to set the this to the variable that for the scoping issue. 
Using the same code for the above, 

```es6
receive: function() {
  this.handleMessage("hello", message => console.log(message, this.name))
}
```

## Let

Even though ES5 has function scoping, it does not have variable scopes. 
Therefore, if I run 
```javascript
var msg = "hi"
{
  var msg = "bye"
}
console.log(msg) // returns "bye"
```
To resolve this issue, ES6 introduced block scoping. 

```es6
let msg = "hi"
{
  let msg = "bye"
}
console.log(msg) // returns "hi"
```

This means is that you do not have to declare temp, i, variables on top of the function because you are afraid of them being undeclared or hoisited
This is what hoisting is.
```javascript
var declaredVar = "outer"
var declaredFunction = function() {
  alert(declaredVar)
  var declaredVar = "inner new var"
}
fn() // returns undefined
```
This is returning undefined because the compiler finds the declaration first, then associate them with their appropriate scopes. 
There are total 3 declaration, 2 of them called declaredVar. 
When declaredVar was found, JS compiler moves all the declaration to the top of the current scope. This is called hoisting. However, initialization of the variable is not hoisted(moved to the top), so the above code is actually looking like this. 
```javascript
var declaredVar = "outer"
var declaredFunction = function() {
  var declaredVar;
  alert(declaredVar)
  declardedVar = "inner new var"
}
fn() // returns undefined
```
it matches it with the appropriate scope, but the variable inside the function was INITIALIZED AFTER the alert(declaredVar), which is why it returns undefined. 

So in ES6, they introduced `let` which still is hoisted(declared on top), but throws initialize error: `Reference error: variable not defined.`

```javascript
// ES5
function varFunc(){
  var previous = 0;
  var current = 1;
  var i;
  var temp;

  for(i = 0; i < 10; i+=1){
    temp = previous;
    previous = current;
    current = temp + current;
  }
}
```
but in ES6, you can in-line write it, `let` is visible in small scoper than ES5, for a block scope. 
```ES6
function letFunc(){
  let previous = 0;
  let current = 1;

  for(let i = 0; i < 10; i+=1){
    let temp = previous;
    previous = current;
    current = temp + current;
    console.log("let", current) // 1,2,3,4,5,6,7,8,9,10
  }
}
```

## const

  * readonly
  * const follows the scoping
  * useful when declaring unchanging variables such as API_KEY and such.

## Shorthand Properties
Useful to build an object on top of another. See the below example for more clear understanding.

```javascript
let firstName = "james"
let lastName = "hwang"

let person = { firstName, lastName }
console.log(person) // logs out an object with defined properties

let mascot = "wolf"
let team = { person, mascot }

console.log(team) // logs out team object with person object and also mascot. 
```

## Object Enhancements
If you declare 
```javascript
let color = 'red'
let speed = 10

// ES6
var car = {color, speed}

// ES5
var car = {color:color, speed:speed};

// both returns the same result
console.log(car.color); // "red"
console.log(car.speed); // 10

// Also works with functions as well
// ES5
var car = {
  color,
  speed,
  go: function(){
    console.log("vroom");
  }
};
// ES6
var car = {
  color,
  speed,
  go(){
    console.log("vroom");
  }
};
car.go(); // "vroom"
```

## Spread Operator
Instead of typing explicitly, `...` spreads out the individual element in the array to the arguments. For example:
```javascript
let first = [ 1, 2, 3];
let second = [ 1, 2, 3];
first.push(second);
console.log(first); // [ 1, 2, 3, [ 4, 5, 6] ]

// using the spread operator
first.push(...second);
console.log(first); // [1, 2, 3, 4, 5, 6]

// using it in a method
function addThreeThings( a, b, c){
  let result = a + b + c;
  console.log(result); // 6
}
addThreeThings(...first); // 6
```

## Template Literals
Instead of concatenating strings with `'blah' + 'world'`, now it supports one quote concatenation with whitespace supports using the `${}`
```javascript
var salutation = "Hello";
var greeting = `${salutation} , World`; // Hello World
```

## Destructing Assignmnet
```javascript
function generateObj() {
  return {
    color: "blue",
    name: "John",
    state: "New York",
    position: "Forward"
  }
}
var {name, state} = generateObj();
```
When you have array, and only one specific position elements, you can do :

```javascript
var [first,,,,fifth] = ["red", "yellow", "green", "blue", "orange"]

console.log(first); // red
console.log(fifth); // orange
```
Another cool and awesome example for destructing is :
```javascript
var people = [
  {
    "firstName": "james",
    "lastName": "den",
    "phone": "1-637-627-2810",
    "email": "dsdfsfdsf@te.co.uk",
    "address": "ssss Aliquet, Street"
  },
  {
    "firstName": "Skyler",
    "lastName": "Carroll",
    "phone": "1-429-754-5027",
    "email": "Cras.vehicula.alique@diamProin.ca",
    "address": "P.O. Box 171, 1135 Feugiat St."
  },
  {
    "firstName": "Kylynn",
    "lastName": "Madden",
    "phone": "1-637-627-2810",
    "email": "mollis.Duis@ante.co.uk",
    "address": "993-6353 Aliquet, Street"
  }
]
// Inside the .forEach(), () => console.log(arg) was used, but passing the destructing value(firstName) inside {},
//it becomes .forEach(({firstName}) => console.log(firstName))
people.forEach(({firstName})=> console.log(firstName)) // logs firstName of each object from each elements in the array

// You can also create a function!!!
// Skils the first element by passing a comma [,]
// finds the second element and name it Skyler [, Skyler]
var [,Skyler] = people;

// create a function to log email only by passing a email destruction
function logEmail({email}){
  console.log(email);
}

// Passes Skyler, which is the second element of the array named people.
// second object is passed to logEmail function, but destructing email variable is passed
logEmail(Skyler) // which logs Cras.vehicula.aliquet@diamProin.ca
```

## Modules!
ES6 allows exporting modules and importing files. See below for code explanation. 
```javascript
// * imports all, alias is addition from the path
import * as addition from 'math/addition';
// you can also import specific function only.
import { sumTwo } from 'math/addition'

console.log(
  "1 + 3",
  addition.sumTwo(1, 3) // 4
);

console.log(
  "1 + 3 + 4",
  addition.sumTwo(1, 3, 4) // 8
);
```
## Generator
Generator called using *. It is useful for async 