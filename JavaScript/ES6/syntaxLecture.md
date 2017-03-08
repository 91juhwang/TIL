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

