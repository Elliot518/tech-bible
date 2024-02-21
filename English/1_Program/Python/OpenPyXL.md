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
    # get cell B1
    print(sheet.cell(row=1, column=2).value)
    # Go through every other row
    for i in range(1, 8, 2):
        print(i, sheet.cell(row=i, column=2).value)

    # go through all rows and columns
    for i in range(1, sheet.max_row + 1):
        for j in range(1, sheet.max_column + 1):
            print(i, j, sheet.cell(row=i, column=j).value)
    ```
<hr>

### 2-4) Converting Between Column Letters and Numbers

```python
import openpyxl
from openpyxl.utils import get_column_letter, column_index_from_string

# Translate column 1 to a letter
print(get_column_letter(1))
print(get_column_letter(2))
print(get_column_letter(27))
print(get_column_letter(900))

wb = openpyxl.load_workbook('example.xlsx')
sheet = wb['Sheet1']
print('max column for example: %s' % get_column_letter(sheet.max_column))
# Get A's number
print('column index for A: %s' % column_index_from_string('A'))
print('column index for AA: %s' % column_index_from_string('AA'))
```

<hr>

### 2-5) Enumerate by row and cell objects

```python
import openpyxl

wb = openpyxl.load_workbook('example.xlsx')
sheet = wb['Sheet1']

for rowOfCellObjects in sheet['A1':'C3']:
    for cellObj in rowOfCellObjects:
        print(cellObj.coordinate, cellObj.value)
    print('--- END OF ROW ---')
```
