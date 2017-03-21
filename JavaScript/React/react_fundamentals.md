# React Fundamentals

[Facebook Tutorial](https://facebook.github.io/react/docs/introducing-jsx.html)

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

## State
State is similar to props, but it is private and fully controlled by the component.
1. Define ES6 class that extends to `React.component` in order to use features like `local state` and `lifecycle hooks`
2. Add a class constructor that assigns the initial `this.state`
  * Class components should always call the base constructor with props.
```javascript
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}

ReactDOM.render(
  <Clock />,
  document.getElementById('root')
);
```
The above code created a reusable Clock class that simple renders by calling `ReactDOM.render({<clock />, div})`

#### Adding lifecycle methods to a class
In applications with many components, it's very important to free up resources taken by the components when they are destroyed.
  * Mount: setting up a timer whenever a component is rendered for the first time
  * Unmount: Clearing the timer whenever the DOM produced by the clock is removed
React allows something called `componentDidMount()` and `componentWillUnmount()`, which is called **lifecycle hooks**
```javascript
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
    );
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}

ReactDOM.render(
  <Clock />,
  document.getElementById('root')
);
```

1. When `<Clock />` is passed to `ReactDOM.render()`, React calls the constructor of the Clock component. it initializes this.state with an object including the current time. state is re-rendered in step 4

2. React then calls the component's `render()` method. `render()` is when React learns what should be displayed on the screen. React then updates the DOM to match the Clock's render output.

3. When the Clock output is inserted in the DOM, React calls the `componentDidMount()` lifecycle hook. Inside it, we have set `tick()` method to call once a second.

4. Every second the browser calls the `tick()` method. Inside it, the Clock component schedules a UI update by calling `setState()` with an object containing the current time. Thanks to the `setState()` call, React knows the state has changed, and calls `render()` method again(Goes back to step2). This time, `this.state.date` in the `render()` method will be different, and so the render output will include the updated time. React updates the DOM accordingly.

5. If the Clock component is ever removed from the DOM, React calls the `componentWillUnmount()` lifecycle hook so the timer is stopped.

#### Caveats
  * **DO NOT MODIFY STATES DIRECTLY. Use `setState()`**

  > ```javascript
  > // Wrong
  > this.state.comment = 'Hello';
  >
  > // Correct
  > this.setState({comment: 'Hello'});
  > ```

  * **State Updates May Be Asynchronous**
    * React may batch multiple setState() calls into a single update for performance.
    * Because this.props and this.state may be updated asynchronously, you should not rely on their values for calculating the next state.

  > ```javascript
  > // Wrong because it relies on this.state and this.props's value
  > this.setState({
  >   counter: this.state.counter + this.props.increment,
  > });
  >  // Correct
  > this.setState((prevState, props) => ({
  >   counter: prevState.counter + props.increment
  > }));
  > ```
  * ** State updates are merged **
    * This allows `setState()` to update independently with seperate `setState()` calls
  * ** State is an unidirectional data flow**
    *  Any state is always owned by some specific component, and any data or UI derived from that state can only affect components "below" them in the tree.
    * This basically means all components are independent, and each `React.DOM.render()<App />` with 3 `<Clock />` components would set each of their own timer and updates it independently.

## Handling Events
Handling events with React elements is very similar to handling events on DOM elements. There are some syntactic differences:

  * React events are named using camelCase, rather than lowercase.
  * With JSX you pass a function as the event handler, rather than a string.

use this.bind() to bind the function


## Lifting up states
When you want to aggregate data from multiple children or to have two child components communicate with each other, move the state upwards so that it lives in the parent component. The parent can then pass the state back down to the children via props, so that the child components are always in sync with each other and with the parent.

For example: 
  * Consider the tic tac toe game with `Square` component and a `Board` component. 
  * `Square` needs to render the values inside using `state()`
  * But to render the `Sqaure.values` inside a `Board` component, the `state` cannot be stayed inside the `Square`
  * Lift the state up to the parent, so the `Board` and `Square` component both would have it.

Pulling state upwards like this is common when refactoring React components