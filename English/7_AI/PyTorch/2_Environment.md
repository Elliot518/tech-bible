[Back](README.md)

## Setup PyTorch Environment

<hr>

### 1. Install Anaconda

First and foremost, you must install Anaconda, it contains most of the Python libraries a data scientist will ever need to develop and train models.

Please follow the installation instructions for your OS:

- Windows (https://docs.anaconda.com/anaconda/install/windows/)
- macOS (https://docs.anaconda.com/anaconda/install/mac-os/)
- Linux (https://docs.anaconda.com/anaconda/install/linux/)

_Note: Make sure you choose Python 3.X version since Python 2 was discontinued in January 2020._

After installing Anaconda, it is time to create an environment.

&nbsp;

### 2. Conda Virtual Environments

####What is Virtual environments

> Virtual environments are a convenient way to isolate Python installations associated with different projects.
>
> It is like a replication of Python itself and some of its libraries, so,after setting up virtual env, you’ll end up with multiple Python installations on your computer.

####Why can’t I just use one single Python installation for everything?
With so many independently developed Python libraries, each having many different versions and each version having various dependencies, things can get out of hand real quick.

####How to create an environment

- Terminal Mode

```
# eg: here env_name is your environment name
conda create -n env_name anaconda
```
