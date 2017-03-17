# React Fundamentals

## Using Create-react-app
It is the official starter app. 
  * Install create-react-app (if not installed)
  * use the command `create-react-app path_to_app`
  * run `npm start` to start the server

## Components
There are 2 ways to create components. Using JSX or regular Javascript.
```javascript
import React from 'react';

class App extends React.Component {
  render() {
    // first element represents the element(lowercase for html)
    // second argument is props
    // third is the value
    return React.createElement('h1', null, 'This is awesome!')
  }
}
export default App
```
Using JSX is as below
```jsx
class App extends React.component {
  render(){
    return <h1>This is awesome! </h1>
  }
}
export default App
```