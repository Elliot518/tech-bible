[Back](README.md)

## Introduction

<hr>

### 1. What is Anaconda

- Definition

    > Anaconda is a distribution of the Python and R programming languages for scientific computing that aims to simplify package management and deployment. 
    >
    > Anaconda helps you create an environment for many different versions of Python and its package versions.
    >
    > Package versions in Anaconda are managed by the package management system conda(eg: conda install xxx).

- Install Anaconda on your PC

    Official Download Link:
    https://www.anaconda.com/products/individual

    Select "64bit-graphical-installer"

    Verify Installation:

    In comand mode, input
    ```
    conda --version
    ```
    You should see conda version xxx.xx

&nbsp;

### 2. Common Commands of Anaconda

### 2-1) Conda Management(管理conda)

```
1. Check version(查看conda版本)

conda --version

<hr>

2. Update conda(更新升级conda版本)

conda update conda
```

#### 2-2) Environment Operations(环境操作)

```
1）Help(查看环境管理的全部命令帮助)

conda env -h 或 conda  #查看环境管理的全部命令帮助

2）Check system env(查看当前系统下的环境)

conda info -e 或   #查看当前系统下的环境

conda-env list

3）Create new environment(创建环境)

conda create -n env_name  #创建一个名为env_name的新虚拟环境

eg:
# Create a new env of python3.8(创建环境，并指定python3.8版本)
conda create -n CondaPy38 python=3.8  

4）Remove env(删除环境)

conda env remove -n env_name

eg:
conda env remove -n Py38

5）Activate and enter env(激活进入某个环境)

conda activate env_name

eg:
conda activate CondaPy38

6）Deactivate or quit env(退出某个环境)

conda deactivate

7）Clone env(复制某个环境)

conda create -n new_env_name old_env_name

eg:
conda create -n Py38 CondaPy38
```

<hr>

### 2-3) Package Management(包管理)

```
1）Install package(安装包)

conda install package_name(包名)

# Install package of deisignated env(指定的env_name环境)
conda install -n env_name 包名  

# 安装anaconda发行版中的所有包
conda install anaconda  

pip install 包名


2）Remove package(卸载包)

conda remove 包名

# Remove package of deisignated env(指定的env_name环境)
conda remove -n env_name 包名


3）Update package(更新包)

conda update 包名

# Update package of deisignated env(指定的env_name环境)
conda update -n env_name 包名  


4）Check all installed packages(查看已安装的所有包)

conda list

# Check all installed packages of deisignated env(查看指定的env_name环境已安装的所有包)
conda list -n env_name  


5）Search package(查找包)

conda search 包名
```