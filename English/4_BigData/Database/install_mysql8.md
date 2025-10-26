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

    # 将MySQL 8.0的二进制目录添加到环境变量（针对zsh终端，默认M系列Mac使用zsh）
    echo 'export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"' >> ~/.zshrc

    # 若使用bash终端，替换为：
    # echo 'export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"' >> ~/.bash_profile

    # 使环境变量生效
    source ~/.zshrc  # 或 source ~/.bash_profile

    # 设置开机自启动（推荐）
    brew services start mysql@8.0

    # 初始化安全配置（设置密码、删除匿名用户等）
    mysql_secure_installation

    mysql -u root -p
    # 输入密码后，执行以下命令
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

    # 清理残留文件（重要！避免影响后续安装）
    rm -rf /opt/homebrew/var/mysql  # M系列芯片默认数据目录
    rm -rf /opt/homebrew/etc/my.cnf  # 配置文件
    rm -rf ~/.mysql_history  # 历史记录文件
    rm -rf /opt/homebrew/etc/ca-certificates
    rm -rf /opt/homebrew/etc/ca-certificates/cert.pem
    ```

