[Back](README.md)

## Install the Kaggle CLI

<hr>


> The Kaggle CLI is the command-line interface for accessing the Kaggle platform,
which includes data from Kaggle competitions and Kaggle datasets.


### 1. Install Kaggle


- Install by pip
    ```shell
    pip install kaggle --upgrade
    ```

<hr>

- Install by conda

    ```shell
    conda install -c conda-forge kaggle
    ```

&nbsp;

### 2. Configure Kaggle

#### 2-1) Get credentials from Kaggle


go to your Kaggle profile (create one if you don’t have one yet), located at https://www.kaggle.com/{username}/account

In the API section, click Create New API Token

This will download a file called kaggle.json,  you should simply move this file to the location where the Kaggle CLI expects it:
```shell
mkdir ~/.kaggle
mv kaggle.json ~/.kaggle/kaggle.json
```
<hr>




#### 2-2) Verify that it’s working or not

trying to list the available datasets:
```shell
kaggle datasets list
```
![kaggle datasets](https://github.com/Elliot518/mcp-oss-tech/blob/main/ai/kaggle/kaggle_datasets.png?raw=true)




