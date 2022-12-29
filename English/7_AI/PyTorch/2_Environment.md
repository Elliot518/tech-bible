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

####Activate an environment
After setting up an environment, you must activate it.
It means making that Python installation the one to be used now.

```
conda activate env_name
```

&nbsp;

### 3. Install PyTorch

- Anaconda

```
conda install pytorch torchvision -c pytorch
```

<hr>

- pip

```
# Python 3.x
pip3 install torch torchvision
```

####VERIFICATION
To ensure that PyTorch was installed correctly, we can verify the installation by running sample PyTorch code. Here we will construct a randomly initialized tensor.

```
import torch

x = torch.rand(5, 3)
print(x)
```

The output should be something similar to:

```
tensor([[0.3380, 0.3845, 0.3217],
        [0.8337, 0.9050, 0.2650],
        [0.2979, 0.7141, 0.9069],
        [0.1449, 0.1132, 0.1375],
        [0.4675, 0.3947, 0.1426]])
```
