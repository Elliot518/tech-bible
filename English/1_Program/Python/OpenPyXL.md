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


<hr>

### 2-2) Get Sheets from the Workbook

- get a list of all the sheet names in the workbook
    ```python
    print(wb.sheetnames)
    ```

- get a sheet by name from the workbook
    ```python
    sheet = wb['Sheet3']
    print(type(sheet))
    print(sheet.title)
    ```

-  get the active sheet
    ```python
    anotherSheet = wb.active
    print(anotherSheet.title)
    ```

<hr>

### 2-3) Get Cells from the Sheets

- get a cell value from the sheet
    ```python
    print(sheet['A1'].value)
    ```

- get the row, column, and value from the cell
    ```python
    c = sheet['B1']

    print('Row %s, Column %s is %s' % (c.row, c.column, c.value))
    print('Cell %s is %s' % (c.coordinate, c.value))
    ```

- you can also get a cell using the sheet’s cell() method and passing integers for its row and column
    ```python
    print(sheet.cell(row=1, column=2).value)
    # Go through every other row
    for i in range(1, 8, 2):
        print(i, sheet.cell(row=i, column=2).value)
    ```
