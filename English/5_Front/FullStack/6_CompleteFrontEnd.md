[Back](README.md)

## A Complete React Front End Demo

<hr>


### 1. Create React project

Open terminal
```shell
npm create vite@4
```

Name your project, select the React framework and TypeScript variant
![create react skeleton](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/create_react.png?raw=true)

&nbsp;

### 2. Install required dependencies(libraries)

Use VS Code to open root folder of your project, goto terminal tab
```shell
npm install
```
<hr>

Install the MUI component library <br>
eg: installs the Material UI core library and two Emotion libraries. Emotion is a library designed for writing CSS with JavaScript (https://emotion.sh/docs/introduction) <br>
```shell
npm install @mui/material @emotion/react @emotion/styled
```
<hr>

Install React Query v4 and Axios, which we will use for networking in our frontend
```shell
npm install @tanstack/react-query@4
npm install axios
```

<hr>

Run project
```shell
npm run dev
```

<hr>

pen your browser and navigate to the URL:  http://localhost:5173/
and you'll see below effect:

![vite + react](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/vite/vite_react3.png?raw=true)

&nbsp;


### 3. Customize homepage of application

Open App.tsx file, remove default content with below:
```javascript
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import CssBaseline from '@mui/material/CssBaseline';

function App() {
  return (
    <Container maxWidth="xl">
      <CssBaseline />
      <AppBar position="static">
        <Toolbar>
          <Typography variant="h6">
            MCP Shop
          </Typography>
        </Toolbar>
      </AppBar>
    </Container>
  );
}

export default App;
```

_We wrap the AppBar component inside the MUI Container component, which is a basic layout component that centers your app content horizontally. We can use the position prop to define the positioning behavior of the app bar. The value static means that the app bar is not fixed to the top when the user scrolls.<br>
The maxWidth prop defines the maximum width of our app, and we have used the largest 
value. We have also used the MUI CssBaseline component, which is used to fix inconsistencies across browsers, ensuring that the React app’s appearance is uniform across 
different browsers. It is typically included at the top level of your application to ensure 
that its styles are applied globally._

Remove index.css from main.tsx 
```javascript
import './index.css'
```

<hr>

Run the project, it looks like below

![react app](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/react/first_app.png?raw=true)
