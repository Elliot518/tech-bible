[Back](README.md)

## Creating a project with Create React App

<hr>


### 1. Using Create React App

> Create React App is a popular tool for creating React projects. It is based on webpack.

Visual Studio Code->Terminal
```bash
npx create-react-app myapp-name --template typescript
```
npx allows npm packages to temporarily be installed and run. It is a common method of running project scaffolding tools such as Create React App.
create-react-app is the package for the Create React App tool that creates the project.

&nbsp;

### 2. Adding linting to Visual Studio Code

> Linting is the process of checking code for potential problems. It is common practice to use linting 
tools to catch problems early in the development process as code is written.

- ESLint
    > ESLint is a popular tool that can lint React and TypeScript code.

    _Fortunately, Create React App has already installed and configured ESLint in project._

- install an ESLint extension into Visual Studio Code

    ```
    Visual Studio Code->Extensions->Search "eslint"

    Check:
    Settings->search box, enter "eslint: probe"->select the Workspace tab
    ->Make sure that typescript and typescriptreact are on the list. If not, add them using the Add Item button

    The ESLint extension for Visual Studio Code is now installed and configured in the project!
    ```
    For more information about ESLint, see the following link: https://eslint.org/

&nbsp;

### 3. Adding code formatting

> Automatic code formatting ensures code is consistently formatted, which helps its readability.

- Prettier
    > Prettier is a popular tool capable of formatting React and TypeScript code.
    
    _Unfortunately, Create React App doesn’t install and configure it for us._
    
    _Prettier is installed as a development dependency because it is only used during development time and not at runtime._

    Take the following steps to install and configure Prettier in the project:
    1) Install Prettier
        ```bash
        npm i -D prettier
        ```
    <hr>

    2) Install two libraries to allow Prettier to take responsibility for the styling rules from ESLint
        ```bash
        npm i -D eslint-config-prettier eslint-plugin-prettier
        ```
        _eslint-config-prettier disables conflicting ESLint rules, and eslint-plugin-prettier is an ESLint rule that formats code using Prettier_
    <hr>

    3) Update ESLint configuration to allow Prettier to manage the styling rules
    - Add the Prettier rules to the eslintConfig section in package.json
        ```json
        {
            ...,
            "eslintConfig": {
                "extends": [
                    "react-app",
                    "react-app/jest",
                    "plugin:prettier/recommended"
                ]
            },
            ...
        }
        ```
    <hr>

    4) File to configure prettier
    - Create a file called .prettierrc.json with the following content in the root folder
        ```json
        {
            "printWidth": 100,
            "singleQuote": true,
            "semi": true,
            "tabWidth": 2,
            "trailingComma": "all",
            "endOfLine": "auto"
        }
        ```
        _What we specified the above:_
   
    - Lines wrap at 100 characters
   
    - String qualifiers are single quotes
   
    - Semicolons are placed at the end of statements
   
    - The indentation level is two spaces
   
    - A trailing comma is added to multi-line arrays and objects
   
    - Existing line endings are maintained

        _More information on the configuration options can be found at the following link: https://prettier.io/docs/en/options.html_
    <hr>

    5) Install a Prettier VS plugin
        ```
        Visual Studio Code->Extensions->enter "prettier"->Install an extension called Prettier – Code formatter

        Check:
        Settings->search box enter "format on save"->select the Workspace tab
        ->make sure the "Format On Save" option is ticked
        ```
        ![format on save](https://github.com/Elliot518/mcp-oss-repo/blob/main/ide/vscode/format_on_save.png?raw=true)
        _This setting tells Visual Studio Code to automatically format code in files that are saved_

        - one more setting to set

            make sure "Default Formatter" is set to "Prettier - Code formatter"
        ![default formatter](https://github.com/Elliot518/mcp-oss-repo/blob/main/ide/vscode/default_formatter.png?raw=true)

&nbsp;

### 4. Starting the app in development mode

```bash
npm start
```

_If your app reports Prettier formatting issues, open the file in question and save it. This will correctly format the file and resolve the errors._

result:
![react](https://github.com/Elliot518/mcp-oss-repo/blob/main/frontend/react/react_start.png?raw=true)





