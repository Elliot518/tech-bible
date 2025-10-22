[Back](README.md)

## bash_profile becomes invalid after restarting terminal

<hr>


### 1. Cause

> In macOS, the default shell used by Terminal may not be bash, but zsh (starting with macOS Catalina 10.15). This can cause the configuration in .bash_profile to not take effect after restarting Terminal, requiring manual sourcing. This is because the current shell will not load configuration files that do not belong to it.
&nbsp;

### 2.  Check current shell

Open the terminal and enter the following command to view the current shell:
```shell
echo $SHELL
```

- If the output is /bin/zsh (the default), zsh is used and .bash_profile is not automatically loaded.
- If the output is /bin/bash, .bash_profile is used.

&nbsp;

### 3. Solution

- 3-1) Copy the contents of .bash_profile to .zshrc:
    ```shell
    cat ~/.bash_profile >> ~/.zshrc
    ```

- 3-2) Restart the terminal and the configuration will automatically take effect without manual source


