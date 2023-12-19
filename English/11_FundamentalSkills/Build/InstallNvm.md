[Back](README.md)

## Install NVM(macOS)

<hr>

### 1. Install Homebrew

You will need to install Homebrew first. 

_To do this, open a terminal window and run the following command:_
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

&nbsp;

### 2. Remove Existing Node Versions

```shell
brew uninstall --ignore-dependencies node 
brew uninstall --force node 
```

&nbsp;

### 3. Install nvm
```shell
brew install nvm
```

#### Add nvm to your shell profile
_To make nvm available every time you open a new terminal window_

vi ~/.bash_profile or ~/.zshrc

add the following line to your shell profile
```shell
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && \. "/usr/local/opt/nvm/etc/bash_completion"
```

Press ESC + :wq to save and close your file




source ~/.bash_profile   # or source ~/.zshrc 

&nbsp;

### 4. Install Node.js

- list of all available Node.js versions that you can install with nvm

    ```shell
    nvm ls-remote
    ```

    ```shell
    # install the latest version of Node.js
    nvm install node

    ## Installing Node.js 18.X version 
    nvm install 18       
    ```

&nbsp;

### 5. Use specific version of Node

- list installed versions

    ```shell
    nvm ls 
    ```

- use specific version
    ```shell
    nvm use 18
    ```







