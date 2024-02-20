[Back](README.md)

## OpenPyXL

<hr>


> The openpyxl module allows your Python programs to read and modify Excel spreadsheet files.

&nbsp;

### 0. Basic Conceptions


- workbook
    > An Excel spreadsheet document is called a workbook. A single workbook is saved in a file with the .xlsx extension.

- sheet
    > Each workbook can contain multiple sheets (also called worksheets). The sheet the user is currently viewing (or last viewed before closing Excel) is called the active sheet.

&nbsp;

### 1. Install the openpyxl Module

- install the latest version
    ```shell
    pip install openpyxl
    ```

- install a specific version
    ```shell
    pip install --user -U openpyxl==2.6.2
    ```

&nbsp;

### 2. Read Excel Documents

### 2-1) Open Excel Documents with OpenPyXL

```python
import openpyxl

wb = openpyxl.load_workbook('example.xlsx')
print(type(wb))
```






