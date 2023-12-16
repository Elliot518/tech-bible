[Back](README.md)

## Create and run a React app

<hr>

### 1. Introduce Vite

> Vite (https://vitejs.dev/) is a next generation Frontend tool, it is very fast.

_(There are excellent React frameworks available, like Next.js or Remix, that can be used as well, but Vite is a good option to learn React basics.)_

#### Create React App (CRA) was the most popular tool for creating React projects, but now it is no longer recommended by official documentation. 

#### Vite offers many advantages over CRA, such as its faster development server.


&nbsp;

### 2. Create react app by vite

2-1） Installing create-vite package


#### Open terminal and move to a folder where you want to create your project
```shell
# use latest version
npm create vite@latest

# or use specific version
npm create vite@4.3
```

<hr>

2-2) Type project name and select the React framework
![select the React framework](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/vite/vite_react1.png?raw=true)

<hr>

2-3)  Select JavaScript or TypeScript variant
![select variant](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/vite/vite_react2.png?raw=true)

<hr>

2-4) Install dependencies

Use VS Code to open the app folder just created by you, go to Terminal->New Terminal
```
npm install
```

<hr>

2-5) Run your app

In your terminal
```shell
npm run dev
```

If everything goes well, you'll see below in your terminal
```shell
> react-vite-app@0.0.0 dev
> vite


  VITE v5.0.10  ready in 371 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```

Open your browser and navigate to the URL:  http://localhost:5173/

and you'll see below effect:

![vite + react](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/vite/vite_react3.png?raw=true)

&nbsp;

### 3. Debugging a React app

3-1) Install React Developer Tools

_(available for Chrome, Firefox, and Edge browsers)_

- Chrome Web Store (https://chrome.google.com/webstore/category/extensions)

- Firefox add-ons site (https://addons.mozilla.org)

<hr>

![chrome react tool](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/chrome/chrome_react_tool.png?raw=true)

<hr>

![chrome react tool2](https://github.com/Elliot518/mcp-oss-tech/blob/main/frontend/chrome/chrome_react_tool2.png?raw=true)
