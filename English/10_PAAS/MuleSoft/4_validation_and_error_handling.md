[Back](README.md)

## Add Validation and Error Handling

<hr>

### 1. Validation

#### Add the Validate size operation to the hello-world project:

1. In the hello-world project in Studio, open hello-world.xml if it isn’t already open, and make sure you are viewing the Message Flow tab of the canvas.

2. In Mule Palette, select Add Modules > Validation and drag it to the drag and drop area in the left side of Mule Palette.

3. From the list of operations displayed, drag Validate size to the canvas and drop it to the right of Set Payload, inside the endpoint module.

4. Click Validate size to display the General configuration tab.

5. Set these values in the General tab:

    a. Value: Click the fx button to change from literal mode to expression mode, and then enter payload after the characters in the text box. Notice the closing bracket is supplied for you.

    b. Min: 6

    c. Max: 30

    d. Error options > Message: The specified message is either too long or too short.
