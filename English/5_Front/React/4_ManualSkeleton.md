[Back](README.md)

## Manually create a react skeleton

<hr>


### 1. Creating the folder structure

> The structure will separate the project’s configuration files from the source code.

The src folder will hold all the source code for the app. 
The project configuration files will be placed at the root of the project.

&nbsp;

### 2. Creating package.json

> The package.json file defines our project name, description, npm scripts, dependent npm modules, and much more.

- package.json
```json
{
	"name": "my-app",
	"description": "My React and TypeScript app",
	"version": "0.0.1"
}
```

&nbsp;

### 3. Adding a web page

> Put an HTML page in the src folder to host the app.

The React app will be injected into the div element with an id attribute value of "root".

- index.html

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>My app</title>
	</head>
	<body>
		<div id="root"></div>
	</body>
</html>
```

&nbsp;

### 4. Adding TypeScript

> Install TypeScript into the project.

4-1) install typescript

Visual Studio Code->Terminal
```bash
npm install --save-dev typescript
```

--save-dev means typescript is installed as a development-only dependency
- package.json
```json
{
	...
	"devDependencies": {
		"typescript": "^4.6.5"
	}
}
```

<hr>

4-2) create a TypeScript configuration file using Babel to do transpilation

- tsconfig.json
```json
{
    "compilerOptions": {
      "noEmit": true,
      "lib": [
        "dom",
        "dom.iterable",
        "esnext"
      ],
      "moduleResolution": "node",    
      "allowSyntheticDefaultImports": true,
      "esModuleInterop": true,
      "jsx": "react",
      "forceConsistentCasingInFileNames": true,
      "strict": true
    },
    "include": ["src"],
    "exclude": ["node_modules", "dist"]
  }
  
```

- explanaton
```
1. Setting noEmit to true suppresses the TypeScript compiler from doing any transpilation

2. Setting allowSyntheticDefaultImports and esModuleInterop to true allows 
React to be imported as a default import, eg:
	import React from 'react'

3. Setting forceConsistentCasingInFileNames to true enables the type-checking 
process to check the casing of referenced filenames in import statements are consistent
```

&nbsp;

### 5. Adding React

5-1) install React

Visual Studio Code->Terminal
```bash
npm install react react-dom
```

- react

	core library


- react-dom

	used to build web apps


<hr>

5-2) include TypeScript types

```bash
npm install --save-dev @types/react @types/react-dom
```

<hr>



5-3) create root component

create index.tsx in src folder:
```javascript
import React, { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';

const root = createRoot(document.getElementById('root') as HTMLElement);

function App() {
  return <h1>My Super React and TypeScript App! {new Date().toString()}</h1>;
}

root.render(
  <StrictMode>
    <App />
  </StrictMode>,
);
```

&nbsp;

### 6. Adding Babel

> Babel will transpile both React and TypeScript code into JavaScript

6-1) install the core Babel library

Visual Studio Code->Terminal
```bash
npm install --save-dev @babel/core
Or
npm i -D @babel/core
```
Babel is installed as a development dependency because it is only needed during development to transpile code and we don't need it when the app runs

<hr>

6-2) install a Babel plugin that allows the latest JavaScript features to be used

```bash
npm i -D @babel/preset-env
```

<hr>

6-3)  install a Babel plugin that enables React code to be transformed into JavaScript

```bash
npm i -D @babel/preset-react
```

<hr>

6-4) install a Babel plugin that enables TypeScript code to be transformed into JavaScript

```bash
npm i -D @babel/preset-typescript
```

<hr>

6-5) install two plugins to allow the use of the async and await features in JavaScript
```bash
npm i -D @babel/plugin-transform-runtime @babel/runtime
```

<hr>

6-6) configure Babel in a file called .babelrc.json

```json
{
	"presets": [
		"@babel/preset-env",
		"@babel/preset-react",
		"@babel/preset-typescript"
	],
	"plugins": [
		[
			"@babel/plugin-transform-runtime",
			{
				"regenerator": true
			}
		]
	]
}
```
The above configuration tells Babel to use the installed plugins

&nbsp;

### 7. Adding webpack

_glue everything together with webpack_

7-1) install webpack
- install the core webpack library as well as its command-line interface

  ```bash
  npm i -D webpack webpack-cli
  ```

<hr>


- install webpack’s development server
  ```bash
  npm i -D webpack-dev-server
  ``` 

<hr>

- install a webpack plugin to allow Babel to transpile the React and TypeScript code into JavaScript
  ```
  npm i -D babel-loader
  ```
