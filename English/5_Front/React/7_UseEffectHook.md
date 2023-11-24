[Back](README.md)

## Use the effect Hook

<hr>


### 1. What is effective hook in react

> The effect Hook is used for component side effects. A component side effect is something executed outside the scope of the component such as a web service request.

&nbsp;


### 2. How to define an effective hook

>The effect Hook is defined using the useEffect function from React. useEffect contains two parameters.


- A function that executes the effect
    This is a minimum parameter, this function runs each time the component is rendered

- An optional array of dependencies
    That cause the effect function to rerun when changed

```javascript
function SomeComponent() {
 function someEffect() {
 console.log("Some effect");
 }
 useEffect(someEffect);
 return ...
}
```

or you can use lambda
```javascript
function SomeComponent() {
 useEffect(() => {
 console.log("Some effect");
 });
 return ...
}
```

&nbsp;

### 3. The rules of Hooks

- A Hook can only be called at the top level of a function component

    > a Hook can’t be called in a loop or in a nested function such as an event handler



- A Hook can’t be called conditionally

- A Hook can only be used in function components and not class components

eg:
```javascript
// useEffect has been lifted to the top level and now depends on 
// the clicked state that is set in 
the handler function

export function AnotherComponent() {
	const [clicked, setClicked] = useState(false);
	useEffect(() => {
		if (clicked) {
			console.log("Some effect");
		}
	}, [clicked]);

	function handleClick() {
		setClicked(true);
	}

	return <button onClick={handleClick}>Cause effect</button>;
}
```

