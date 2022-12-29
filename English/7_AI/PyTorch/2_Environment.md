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

&nbsp;

### 4. Install TensorBoard

> TensorBoard is TensorFlow’s visualization toolkit, and provides the visualization and tooling needed for machine learning experimentation.

TensorBoard is a powerful tool, and we can use it even if we are developing models in PyTorch. Luckily, you don’t need to install the whole TensorFlow to get it, you can easily install TensorBoard alone using Conda.

```
# install tensorboard alone
conda install -c conda-forge tensorboard
```

&nbsp;

### 5. Install GraphViz and Torchviz (optional)

> GraphViz is an open source graph visualization software. It is a way of representing structural information as diagrams of abstract graphs and networks.

- Install GraphViz
  We need to install GraphViz to use TorchViz, a neat package that allows us to visualize a model’s structure. Please check the installation instructions for your OS at https://www.graphviz.org/download/

If you are using Windows, please use the GraphViz’s Windows Package installer at https://graphviz.gitlab.io/_pages/Download/windows/graphviz-2.38.msi

- Install torchviz
  After installing GraphViz, you can install the torchviz package. This package is not part of Anaconda Distribution Repository and is only available at [PyPI](https://pypi.org/), the Python Package Index, so we need to pip install it.

pip

```
pip install torchviz
```

anaconda

```
conda install torchviz
```

##### check your GraphViz / TorchViz installation

```
import torch
from torchviz import make_dot
v = torch.tensor(1.0, requires_grad=True)
make_dot(v)
```

Output

```
<graphviz.dot.Digraph object at 0x7ff540c56f50>
```

&nbsp;

### 6. Install Juyter
