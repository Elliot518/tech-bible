[Back](README.md)

## Setup React Environment

<hr>

### 1. Install Node(Using NVM)

Although you can download Node.js directly from the official website [https:/​/​nodejs.​org](https:/​/​nodejs.​org)

But I highly recommended you install by [NVM(Node Version Manager](https://github.com/nvm-sh/nvm)

_The reason is simple: With so many independently developed javascipt libraries, each having many different versions dependencies on the Node version, things can get out of hand real quick if we just stick to one Node version, but NVM can help us switch to differrnt Node versions very easily.Work could become easier._

- Install the latest version

```
# "node" is an alias for the latest version:
nvm install node
```

- install by global version

```
# You can also install a global version of node (will install the latest from that version):
nvm install 14
nvm install 12
nvm install 10
nvm install 9
nvm install 8
nvm install 7
nvm install 6
```

- install a very specific version

```
nvm install 14.18.3
```

#### switch between node versions by using nvm

```
# use latest version
nvm use node

# use by global version
nvm use 12

# use specific version
nvm use 14.18.3
```

&nbsp;

### 2. Create React App via Skeleton

You’ll need to have Node >= 14.0.0 and npm >= 5.6 on your machine.
To create a project, run:

```
npx create-react-app my-app
```

_Note: a package runner tool that comes with npm 5.2+_

The above command line just creates a frontend build pipeline, it uses Babel and webpack, but you don’t need to know anything about them right now.

&nbsp;

### 3. Start react app by dev mode

```
cd my-app
npm start
```
