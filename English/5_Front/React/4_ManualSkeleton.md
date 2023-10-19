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

4-1) Visual Studio Code->Terminal
