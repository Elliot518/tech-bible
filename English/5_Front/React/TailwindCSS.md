[Back](README.md)

## Tailwind CSS

<hr>


### 1. What is Tailwind CSS

> Tailwind is a set of prebuilt CSS classes that can be used to style an app. It is referred to as a utility first CSS framework because the prebuilt classes can be thought of as flexible utilities.

An example CSS class is bg-white, which styles the background of an element white – bg is short for background. Another example is bg-orange-500, which sets the background color to a 500 shade of orange.


- example
  
  _(styles a button element in JSX):_
  ```javascript
  <button className="border-none rounded-md bg-emerald-700 text-white cursor-pointer">
    ...
  </button>
  ```

&nbsp;

### 2. Install Tailwind CSS

#### 2-1) Install Tailwind CSS and Its Dependencies
```shell
npm install tailwindcss postcss autoprefixer
```

<hr>

#### 2-2) Create Tailwind Configuration Files

```shell
npx tailwindcss init -p
```
After executing the command, it'll create a tailwind.config.js file and a postcss.config.js file in the root folder of your project

<hr>

#### 2-3) Configure Tailwind CSS

- tailwind.config.js

  ```javascript
  /** @type {import('tailwindcss').Config} */
  export default {
    content: [
      './index.html',
      './src/**/*.{js,ts,jsx,tsx}',
    ],
    theme: {
      extend: {},
    },
    plugins: [],
  }
  ```

- postcss.config.js
  ```javascript
  export default {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  }
  ```
<hr>

#### 2-4) Ensure Your CSS File Imports Tailwind Directives

Make sure your src/index.css file imports the Tailwind directives:

add the following three lines at the top of the file
```javascript
@tailwind base;
@tailwind components;
@tailwind utilities;
```


**Tailwind is now installed and ready to use**


