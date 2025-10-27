[Back](README.md)

## Install MySQl 8

<hr>


### 1. Install MySQL 8 on macOS

- Homebrew

    ```shell
    # Search and confirm the MySQL 8 version
    brew search mysql

    #brew install mysql

    brew install mysql@8.0

    # Add the MySQL 8.0 binary directory to the environment variable 
    # (for the zsh terminal, the default M series Mac uses zsh)
    echo 'export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"' >> ~/.zshrc

    # If you use the bash terminal, replace it with:
    # echo 'export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"' >> ~/.bash_profile

    # Make environment variables effective
    source ~/.zshrc  # or source ~/.bash_profile

    # Set to start automatically at boot (recommended)
    brew services start mysql@8.0

    # Initialize security configuration (set passwords, delete anonymous users, etc.)
    mysql_secure_installation

    mysql -u root -p
    # After entering the password, execute the following command
    SELECT VERSION();
    ```

&nbsp;

### 2. Stop the MySQL service & Uninstall MySQL

- Homebrew
    ```shell
    # Stop the MySQL service
    brew services stop mysql

    mysql.server stop

    brew uninstall mysql

    # Clean up residual files (Important! To avoid affecting subsequent installations)
    rm -rf /opt/homebrew/var/mysql  # M series chip default data directory
    rm -rf /opt/homebrew/etc/my.cnf  # Configuration file
    rm -rf ~/.mysql_history  # history file
    ```



