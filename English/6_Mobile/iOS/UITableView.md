[Back](README.md)

## UITableView

<hr>


### 1. Set the initial view controller to be a table view controller

1. Open Main.storyboard, select the existing View Controller and press Delete. 

2. Drag a Table View Controller fromthe library onto the canvas. 

3. With the Table View Controller selected, open its identity inspector and change the class to ItemsViewController. 
    ![tableview 1](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview1.png?raw=true)

4. Open the attributes inspector for Items View Controller and check the Is Initial View Controller checkbox.
    ![tableview 2](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview2.png?raw=true)

&nbsp;

### 2. Set header for table view and auto layout constraints

![view header](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview1_viewheader.png?raw=true)

![view size](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview2_viewsize.png?raw=true)

1. Select both of the buttons and open the Auto Layout Align menu.

2. Select Vertically in Container with a constant of 0, and then click Add 2 Constraints

![view vertial constraints](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview3_constraint1.png?raw=true)

3. Now open the Add New Constraints menu and configure it as shown in Figure

![add new constraints](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview4_consttraint2.png?raw=true)

4. connect the actions for the two buttons

![view header](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/UI/uitableview5_ibaction.png?raw=true)

&nbsp;

### 3. Customize table view cell

#### 3-1) Change style and identifier of the cell
Open Main.storyboard and select the UITableViewCell in the document outline. 
Open its attributes inspector, change the Style to Custom, and change the Identifier to ItemCell.

![Change style and identifier of the cell](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/tableview/customtablecell_1.png?raw=true)

<hr>

#### 3-2) Input class for cell

Now open its identity inspector (the tab). In the Class field, enter ItemCell

![Input class for cell](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/tableview/customtablecell_2.png?raw=true)

<hr>

#### 3-3) Set height of the cell

Change the height of the prototype cell to be about 65 points tall by selecting the table view cell and changing the Row Height in its size inspector

![Set height of the cell](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/tableview/customtablecell_3.png?raw=true)

<hr>

1) Select the top-left label and open the Auto Layout Add New Constraints
menu. Select the top and left struts and then click Add 2 Constraints

2) You want the bottom-left label to always be aligned with the top-left
label. Control-drag from the bottom-left label to the top-left label
and select Leading.

3) With the bottom-left label still selected, open the Add New Constraints
menu, select the bottom strut, and then click Add 1 Constraint.

4) Select the right label and Control-drag from this label to its
superview on its right side. Select both Trailing Space to Container and
Center Vertically in Container.


5) Select the bottom-left label and open its size inspector. Find the
Vertical Content Hugging Priority and lower it to 250. Lower the Vertical Content
Compression Resistance Priority to 749.

6) Your frames might be misplaced, so select the three labels and click
the Update Frames button.

