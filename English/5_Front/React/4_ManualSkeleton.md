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


