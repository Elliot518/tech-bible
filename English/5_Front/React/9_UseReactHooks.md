[Back](README.md)

## Use React Hooks

<hr>


### 1. What are React Hooks

> React Hooks are functions that let developers use state and other React features in functional components. 

Before the introduction of hooks in React version 16.8, stateful logic could only be implemented in class components. With hooks, functional components can now have state, lifecycle methods, and other features that were previously exclusive to class components.


Three commonly used React Hooks:
- useState

    Allows functional components to have state variables.

- useEffect

    Performs side effects in functional components, similar to lifecycle methods in class components. A component side effect is something executed outside the scope of the component such as a web service request.

- useContext

    Provides a way to consume the values of a React context.

&nbsp;

### 2. Using state Hooks

The useState Hook allows state to be defined in a variable. 

The syntax for useState is as follows:
```typescript
const [state, setState] = useState(initialState);
```

A simeple useState demo:
```typescript
import React, { useState } from 'react';

function Example() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```
<hr>

#### Advanced useState hooks

#### 2-1) Add useState to the React import statement
- PersonScore.tsx
    ```typescript
    import { ..., useState } from 'react';
    ```

<hr>

#### 2-2) Add state definitions
eg: for name, score, and loading at the top of the component function
- PersonScore.tsx
    ```typescript
    export function PersonScore() {
        const [name, setName] = useState<string | undefined>();
        const [score, setScore] = useState(0);
        const [loading, setLoading] = useState(true);

        ...
    }
    ```
    _The score state is initialized to 0 and loading is initialized to true_
<hr>

#### 2-3) Change the effect function to set the loading and name state values after the person data has been fetched

- PersonScore.tsx
    ```typescript
    export function PersonScore() {
        ...

        useEffect(() => {
            getPerson().then((person) => {
                setLoading(false);
                setName(person.name);
            });
        }, []);
    }
    ```
    _After the person has been fetched, loading is set to false, and name is set to the person’s name_
<hr>

#### 2-4) Add the following if statement in between the useEffect call and the return statement
- PersonScore.tsx
    ```typescript
    export function PersonScore() {
        useEffect( ... );

        if (loading) {
            return <div>Loading ...</div>;
        }

        return ...
    }
    ```

    _This displays a loading indicator when the loading state is true_

<hr>

#### 2-5) Change the component’s return statement from outputting nothing to outputting the followin
- PersonScore.tsx
```typescript
export function PersonScore() {
    ...

    if (loading) {
        ...
    }

    return (
        <div>
            <h3>
                {name}, {score}
            </h3>
            <button onClick={() => setScore(score + 1)}>Add</button>
            <button onClick={() => setScore(score - 1)}>Subtract</button>
            <button onClick={() => setScore(0)}>Reset</button>
        </div>
    );
}
```
&nbsp;

### 3. Understanding useReducer

> useReducer is an alternative method of managing state. It uses a reducer function for state changes, which takes in the current state value and returns the new state value.


- syntax
```typescript
const [state, dispatch] = useReducer(reducer, initialState);
```

useReducer takes in a reducer function and the initial state value as parameters. It then returns a tuple containing the current state value and a function to dispatch state changes.

```typescript
function reducer(state: State, action: Action): State {
    switch (action.type) {
        case 'add':
            return { ...state, total: state.total + action.amount };
        case ...
            ...
        default:
            return state;
    }
}
```

<hr>

```typescript
const [state, dispatch] = useReducer<Reducer<State, Action>>(
    reducer,
    initialState
);
```

_Reducer is a standard React type that has generic parameters for the type of state and the type of action_

useReducer is more complex than useState because state changes go through a reducer function that we must implement. This benefits complex state objects with related properties or when a state change depends on the previous state value.

<hr>

#### 3-1) Import useReducer instead of useState from React

```typescript
import { ..., useReducer } from 'react';
```

<hr>

#### 3-2) Define a type for the state

```typescript
type State = {
    name: string | undefined;
    score: number;
    loading: boolean;
};
```

<hr>

#### 3-3) Define types for all the action objects

```typescript
type Action =
    | {
        type: 'initialize';
        name: string;
    }
    | {
        type: 'increment';
    }
    | {
        type: 'decrement';
    }
    | {
        type: 'reset';
    };
```
<hr>

#### 3-4) Define reducer function

```typescript
function reducer(state: State, action: Action): State {
    switch (action.type) {
        case 'initialize':
            return { name: action.name, score: 0, loading: false };
        case 'increment':
            return { ...state, score: state.score + 1 };
        case 'decrement':
            return { ...state, score: state.score - 1 };
        case 'reset':
            return { ...state, score: 0 };
        default:
            return state;
    }
}
```
<hr>

#### 3-5) Replace the useState calls with the useReducer call
- useState demo
    ```typescript
    const [name, setName] = useState<string | undefined>();
    const [score, setScore] = useState(0);
    const [loading, setLoading] = useState(true);
    ```

- useReducer demo
    ```typescript
    const [{ name, score, loading }, dispatch] = useReducer(reducer, {
        name: undefined,
        score: 0,
        loading: true,
    });
    ```
    _The state has been initialized with an undefined name, a score of 0, and loading set to true_

<hr>

- PersonScore.tsx
    ```typescript
    useEffect(() => {
        getPerson().then(({ name }) => dispatch({ type: 'initialize', name }));
    }, []);
    ```
<hr>

#### 3-6) Dispatch the relevant actions in the button click handlers
- PersonScore.tsx
```typescript
return (
    <div>
        <h3>
            {name}, {score}
        </h3>
        <button onClick={() => dispatch({ type: 'increment' })}>Add</button>
        <button onClick={() => dispatch({ type: 'decrement' })}>Subtract</button>
        <button onClick={() => dispatch({ type: 'reset' })}>Reset</button>
    </div>
);
```

&nbsp;

### 4. Using the ref Hook

#### 4-1) What is ref Hook

> The ref Hook is called useRef and it returns a variable whose value is persisted for the lifetime of a component. This means that the variable doesn’t lose its value when a component re-renders.


The value returned from the ref Hook is often referred to as a ref. The ref can be changed without causing a re-render

syntax for useRef:
```typescript
const ref = useRef(initialValue);
```

The type of the ref can be explicitly defined in a generic argument for useRef:
```typescript
const ref = useRef<Ref>(initialValue);
```

The value of the ref is accessed via its current property:
```typescript
console.log("Current ref value", ref.current);
```
The value of the ref can be updated via its current property as well
```typescript
ref.current = newValue;
```

A common use of the useRef Hook is to access HTML elements imperatively. HTML elements have a ref attribute in JSX that can be assigned to a ref:
```typescript
function MyComponent() {
    const inputRef = useRef<HTMLInputElement>(null);
    
    function doSomething() {
        console.log("All the properties and methods of the input", inputRef.current);
    }

    return <input ref={inputRef} type="text" />;
}
```

<hr>

#### 4-2) refHook example

1) Import useRef from React

- PersonScore.tsx
    ```typescript
    import { ..., useRef } from 'react';
    ```
<hr>

2) Create a ref for the Add button

- PersonScore.tsx
    ```typescript
    const [ ... ] = useReducer( ... );

    const addButtonRef = useRef<HTMLButtonElement>(null);

    useEffect( ... )
    ```
<hr>

3) Assign the ref to the ref attribute on the Add button JSX element

- PersonScore.tsx
    ```typescript
    <button ref={addButtonRef} onClick={() => dispatch({ type: 'increment' })}>
        Add
    </button>
    ```
<hr>

4) Now that we have a reference to the Add button, we can invoke its focus method to move the focus to it when the person’s information has been fetched

Let’s add another effect to do this below the existing effect that fetches the person:
- PersonScore.tsx
    ```typescript
    useEffect(() => {
        getPerson().then(({ name }) =>
            ...
        );
    }, []);


    useEffect(() => {
        if (!loading) {
            addButtonRef.current?.focus();
        }
    }, [loading]);
    ```
&nbsp;

### 5. Using the memo Hook

#### 5-1) What is memo Hook

> The memo Hook creates a memoized value and is beneficial for values that have computationally expensive calculations.

- Syntax

    ```typescript
    const memoizedValue = useMemo(() => expensiveCalculation(), []);
    ```

<hr>

#### 5-2) How to use the memo Hook

1) Import useMemo from React
- PersonScore.tsx
```typescript
import { ..., useMemo } from 'react';
```
<hr>

2) Add the demo expensive function
```typescript
function sillyExpensiveFunction() {
    console.log('Executing silly function');
    let sum = 0;
    for (let i = 0; i < 10000; i++) {
        sum += i;
    }

    return sum;
}
```
<hr>

3) Add call to the expensive function
```typescript
export function PersonScore() {
    ...

    useEffect(...);

    const expensiveCalculation = useMemo(() => sillyExpensiveFunction(), []);

    if (loading) {
        return <div>Loading ...</div>;
    }
}
```
<hr>

4) Add the result of the function call to the JSX underneath name and score

```html
<h3>
    {name}, {score}
</h3>
<p>{expensiveCalculation}</p>
<button ... >
    Add
</button>
```


<hr>

5) Refresh the browser containing the app and click the buttons

    If you look in the console, you will see that the expensive function is executed every time the component is re-rendered after a button click


&nbsp;

### 6. Using the callback Hook

#### 6-1) What is callback Hook

> The callback Hook memoizes a function so that it isn’t recreated on each render


- syntax
    ```typescript
    const memoizedCallback = useCallback(() => someFunction(), []);
    ```

A function that executes the function to memoize is passed into useCallback as the first argument. The second argument passed to useCallback is an array of dependencies. So, if the someFunction function has dependencies a and b, the call will be as follows:
    ```typescript
    const memoizedCallback = useCallback(
        () => someFunction(a, b), [a, b]
    );
    ```
<hr>

#### 6-2) Understanding when a component is re-rendered

A component re-renders when its state changes
```typescript
export function SomeComponent() {
    const [someState, setSomeState] = useState('something');
    return (
        <div>
            <ChildComponent />
            <AnotherChildComponent something={someState} />
            <button onClick={() => setSomeState('Something else')}></button>
        </div>
    );
}
```
_When someState changes, SomeComponent will re-render – for example, when the button is 
clicked. In addition, ChildComponent and AnotherChildComponent will re-render when 
someState changes. This is because a component is re-rendered when its parent is re-rendered._


There is a function called memo in React that can be used to prevent unnecessary re-renders. The memo function can be applied as follows to ChildComponent to prevent unnecessary re-renders:
```typescript
export const ChildComponent = memo(() => {
    return <span>A child component</span>;
});
```

The memo function wraps the component and memoizes the result for a given set of props. The memoized function is then used during a re-render if the props are the same.


**In summary, React’s memo function can prevent the unnecessary re-rendering of slow components**
<hr>

#### 6-3) How to use the callback Hook

- Problem

    > We will now refactor the PersonScore component by extracting the Reset button into a separate component called Reset. This will lead to unnecessary re-rendering of the Reset component,

- Solution
    > We will resolve using React’s memo function and the useCallback Hook.

