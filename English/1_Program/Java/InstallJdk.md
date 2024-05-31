[Back](README.md)

## Install JDK

<hr>


### 1. Install JDK on Linux

- Java 8
    ```shell
    cd /install_pkg
    tar -xvf jdk-8u261-linux-x64.tar
    or
    tar -zxvf jdk-8u251-linux-x64.tar.gz

    mv jdk1.8.0_261 /soft

    vi /etc/profile
    or
    sudo vi ~/.bashrc


    # 文件的末尾追加下面内容

    # java 8
    export JAVA_HOME=/soft/jdk1.8.0_261
    export JRE_HOME=${JAVA_HOME}/jre  
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
    export PATH=${JAVA_HOME}/bin:$PATH  

    source ~/.bashrc
    or
    source /etc/profile
    ```

<hr>

- Java 17
    ```shell
    cd /install_pkg
    
    tar -zxvf jdk-17_linux-x64_bin.tar.gz

    mv jdk-17.0.11 /soft

    vi /etc/profile
    or
    sudo vi ~/.bashrc


    # 文件的末尾追加下面内容

    # java 17
    export JAVA_HOME=/soft/jdk-17.0.11
    export JRE_HOME=${JAVA_HOME}/jre  
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
    export PATH=${JAVA_HOME}/bin:$PATH  

    source ~/.bashrc
    or
    source /etc/profile
    ```

&nbsp;

### 2. Install JDK on Windows


2-1) 设置环境变量
```
在桌面右键单击 
我的电脑->属性->高级系统设置->高级选项->环境变量
在下侧系统变量处点击新建
```

见下图


![win jdk1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/main/proglang/java/win_jdk1.png)

<hr>

```
2-2) 设置JAVA_HOME

输入变量名：JAVA_HOME，变量值为jdk的安装位置
```

![win jdk2](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/main/proglang/java/win_jdk2.png)

<hr>

```
2-3) 设置CLASSPATH

变量名为
CLASSPATH

变量值为 
.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
```

![win jdk3](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/main/proglang/java/win_jdk3.png)

<hr>

```
2-4) PATH新增环境变量

点击确定后，找到PATH变量，点击编辑。新增如下两个变量值。

见下图
```

![win jdk4](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/main/proglang/java/win_jdk4.png)