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

