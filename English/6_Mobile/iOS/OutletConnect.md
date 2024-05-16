[Back](README.md)

## Outlet Connect

<hr>


### Connect outlet in between swift and storyboard

> With DetailViewController.swift open, Option-click Main.storyboard in the project navigator. This will open the file in another editor next to DetailViewController.swift.

![outlet swift storyboard](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/outlet/connect_outlet_swift_storyboard.png?raw=true)
<hr>

Select the View Controller on the canvas and open its identity inspector. Change the Class to be DetailViewController。

Hide the navigator area and inspector area by clicking the left and right button。

Then, hide the document outline in Interface Builder by clicking the toggle button in the lower-left corner of its editor.

Control-drag from the UITextField next to the Name label to the top of DetailViewController.swift

![conect to swift](https://github.com/Elliot518/mcp-oss-tech/blob/main/mobile/ios/outlet/connect_textfield_swift.png?raw=true)

Let go and a pop-up window will appear. Enter nameField into the Name field, make sure the Storage is set to Strong, and click Connect


