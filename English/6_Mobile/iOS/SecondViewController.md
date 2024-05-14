[Back](README.md)

## SecondViewController

<hr>


### 1. Resolve constaints of labels in Stack View

- Solution 1:

    Select the Date Created label and open its size inspector. Find the
    Vertical Content Hugging Priority and lower it to 249. Now the other
    three labels have a higher content hugging priority, so they will
    all hug to their intrinsic content height. The Date Created label
    will stretch to fill in the remaining space.


- Solution 2:

    Select the stack view, Open its attributes inspector and find the
    section at the top labeled Stack View.

    One of the properties that determines how the content is laid out is the Distribution property. Currently it is set to Fill, which lets the views lay out their content based on their intrinsic content size. Change the value
    to Fill Equally.
![solution 2](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/stackview/constraints_stack_view.jpg?raw=true)

This will resize the labels so that they all have the same height, ignoring the intrinsic content size.

&nbsp;

### 2. NESTED STACK VIEWS

Select the Name label in the item detail view hierarchy on the canvas. Click the rightmost icon in the Auto Layout constraints menu and then select Stack View from the Embed In View section. This will embed the selected view in a stack view

Select the new stack view and open its attributes inspector, change the Axis to Horizontal.

Now drag a Text Field from the library to the right of the Name label.

Open the size inspector for the text field and set its Horizontal Content Compression Resistance Priority to 749. This will ensure that the text field’s text will be truncated if necessary, rather than the label.

![TextField Compression Resistance Priority](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/stackview/textfield_compression_resistance.jpg?raw=true)

&nbsp;

### 3. STACK VIEW SPACING

Select the horizontal stack view and open its attributes inspector. Change the Spacing to be 8 points. Notice that the text field shrinks to accommodate the spacing, because it is less resistant to compression than the label.
![stack view space](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/stackview/stack_view_space.jpg?raw=true)


### Repeat these steps for the other labels except description:

1. Select the label, click the icon, and select Stack View.

2. Change the stack view to be a horizontal stack view.

3. Drag a text field onto the horizontal stack view and change its horizontal content compression resistance priority to be 749.

4. Update the stack view to have a spacing of 8 points.









