[Back](README.md)

## Add the delete functionality

<hr>


> Items can be deleted from the database by sending the DELETE method request to the http://localhost:8080/api/cars/{carId} endpoint.

_We can see that each data object contains a link to itself, which can be accessed from the _links.self.href node. Since we already used the link field in the previous section to set a unique ID for every row in the grid, that row ID can be used in deletion._


### 1. Create a button for each row in the MUI DataGrid


