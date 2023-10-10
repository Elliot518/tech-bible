[Back](README.md)

## Introduction

<hr>

### 1. What is React

- Authoritative Definition
  > React is a declarative, efficient, and flexible JavaScript library for building user interfaces. It lets you compose complex UIs from small and isolated pieces of code called “components”.

&nbsp;

### 2. Introduce React Components

React has a few different kinds of components, but we’ll start with React.Component subclasses.

Look at this example:

```
class ShoppingList extends React.Component {
  render() {
    return (
      <div className="shopping-list">
        <h1>Shopping List for {this.props.name}</h1>
        <ul>
          <li>Instagram</li>
          <li>WhatsApp</li>
          <li>Oculus</li>
        </ul>
      </div>
    );
  }
}

// Example usage: <ShoppingList name="Mark" />
```

Above excample, ShoppingList is a React component class, or React component type. A component takes in parameters, called props (short for “properties”), and returns a hierarchy of views to display via the render method.

#### render()


The render method returns a description of what you want to see on the screen.
React takes the description and displays the result.
In particular, render returns a React element, which is a lightweight description of what to render.


&nbsp;

### 3. Related Tools

- Babel REPL

  >  online tool to briefly explore JSX


  https://babeljs.io/repl

<hr>

- CodeSandbox
  > online tool to build a React component

  https://codesandbox.io
