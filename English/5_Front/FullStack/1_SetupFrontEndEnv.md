[Back](README.md)

## Setting Up the Environment and Tools of Frontend

<hr>

### 1. Steps overview

- Installing Node.js
- Installing Visual Studio Code
- Creating and running a React app
- Debugging a React app

&nbsp;

### 2. Installing Node.js

> Node.js is an open-source, JavaScript-based, server-side environment. It is available for multiple 
operating systems, such as Windows, macOS, and Linux, and is required to develop React apps.

The Node.js installation package can be found at 
https://nodejs.org/en/download/

_Download the latest Long-Term Support (LTS) version for your operating system.
If you are using the Windows 10 operating system, you can get the Node.js MSI installer for it_

- Check

    Command line:
    ```shell
    # check node version(eg: v18.16.0)
    node --version

    # npm comes with the Node.js installation and is a package manager for JavaScript
    npm --version
    ```

&nbsp;

### 3. Installing Visual Studio Code

> Visual Studio Code (VS Code) is an open-source code editor for multiple programming languages. 
It was developed by Microsoft.

_(There are many other alternative code editors available, such as Atom and Sublime)_


VS Code is available for Windows, macOS, and Linux, and you can download it from 
https://code.visualstudio.com/ 

_(Installation for Windows is done with the MSI installer)_

<hr>

- VS Code extensions

    VS Code provide a lot of extensions available for different programming languages and frameworks.

    - Useful extensions
    1) Reactjs code snippets
        > It has multiple code snippets available for React.js apps, which makes the development process faster.

    2) ESLint
        > ESLint (https://eslint.org/) is an open-source linter for JavaScript, and it helps you to find typos and syntax errors quickly, fix problems in your source code and makes formatting source code easier.

        _(ESLint highlights errors and warnings, errors and warnings are shown in red or yellow underlines, and if you hover over these lines, you can see information about the specific error or warning. VS Code also provides a Problems panel that shows all ESLint errors and warnings.)_ 
        
        ESLint can be configured using the **.eslintrc** file, in the file you can define which rules are enabled and at what error level.

    3) Prettier
        > Prettier is a code formatter. With the Prettier extension, you can get automatic code formatting.

        formatted automatically by [File | Preferences | Settings -> Format On Save]

