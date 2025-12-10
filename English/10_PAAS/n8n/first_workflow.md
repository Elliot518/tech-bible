[Back](README.md)

## Your First Workflow

<hr>


### Step 1: Create a new workflow

- 1-1) Choose Start from Scratch to create a new workflow

- 1-2) Select the Create Workflow to create a new workflow
&nbsp;

### Step 2: Add a trigger node

#### n8n provides two ways to start a workflow:

- Manually, by selecting Execute Workflow.
- Automatically, using a trigger node as the first node. The trigger node runs the workflow in response to an external event, or based on your settings.

**We'll use the Schedule trigger. This allows you to run the workflow on a schedule:**


- 2-1) Select Add first step.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/add_first_step.png?raw=true)

- 2-2) Search for **Schedule** (n8n shows a list of nodes that match the search)
- 2-3) Select **Schedule Trigger** to add the node to the canvas. n8n opens the node.
    ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/schedule_trigger.png?raw=true)

- 2-4) For Trigger Interval, select Weeks.
- 2-5) For Weeks Between Triggers, enter 1.
- 2-6) Enter a time and day. For this example, select Monday in Trigger on Weekdays, select 9am in Trigger at Hour, and enter 0 in Trigger at Minute.

    ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/schedule_params.png?raw=true)

- 2-7) Close the node details view to return to the canvas.

  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/schedule_trigger_node.png?raw=true)

&nbsp;

### Step 3: Add the NASA node and set up credentials

_The NASA node interacts with NASA's public APIs to fetch useful data. We will use the real-time data from the API to find solar events._


- 3-1) Select the Add node ![add node icon](img/add_node_icon.png) connector on the Schedule Trigger node.
- 3-2) Search for NASA. n8n shows a list of nodes that match the search.
- 3-3) Select NASA to view a list of operations.
- 3-4) Search for and select **Get a DONKI solar flare**. This operation returns a report about recent solar flares. When you select the operation, n8n adds the node to the canvas and opens it.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/donki_solar_flare.png?raw=true)
- 3-5) To access the NASA APIs, you need to set up credentials:
  a. Select the **Credential for NASA API** dropdown.
  b. Select **Create new credential**. n8n opens the credentials view.
  c. Go to [NASA APIs](https://api.nasa.gov) and fill out the form from the Generate API Key link. The NASA site generates the key and emails it to the address you entered.
  d. Check your email account for the API key. Copy the key, and paste it into API Key in n8n.
  e. Select Save.
  f. Close the credentials screen. n8n returns to the node. The new credentials should be automatically selected in **Credential for NASA API**.
- 3-6) By default, DONKI Solar Flare provides data for the past 30 days. To limit it to just the last week, use **Additional Fields**:
  a. Select **Add field**.
  b. Select **Start date**.
  c. To get a report starting from a week ago, you can use an expression: next to **Start date**, select the **Expression** tab, then select the expand button Add node icon to open the full expressions editor.
  d. In the **Expression** field, enter the following expression:
    ```javascript
    {{ $today.minus(7, 'days') }}
    ```
    _This generates a date in the correct format, seven days before the current date_
- 3-7) Close the **Edit Expression** modal to return to the NASA node.
- 3-8) You can now check that the node is working and returning the expected date: select **Execute step** to run the node manually. n8n calls the NASA API and displays details of solar flares in the past seven days in the **OUTPUT** section.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/nasa_donki_solar_flare_result.png?raw=true)
- 3-9) Close the NASA node to return to the workflow canvas.

  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/scheduler_with_nasa.png?raw=true)

&nbsp;

### Step 4: Add logic with the If node

_/** 
  Use the If node to create two branches that each generate a report from the NASA data. 
  Solar flares have five possible classifications; we will add logic that sends a report with the lower classifications to one output, 
  and the higher classifications to another. 
**/_


#### Add the If node:

- 4-1) Select the Add node **Add node** ![add node icon](img/add_node_icon.png) connector on the NASA node.
- 4-2) Search for **If**. n8n shows a list of nodes that match the search.
- 4-3) Select **If** to add the node to the canvas. n8n opens the node.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/if_node.png?raw=true)
- 4-4） You need to check the value of the classType property in the NASA data. To do this:
  a. Drag **classType** into **Value 1**.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/drag_class_type.png?raw=true)
  b. Change the comparison operation to **String > Contains**.
  c. In **Value 2**, enter **X**. This is the highest classification of solar flare. In the next step, you will create two reports: one for X class solar flares, and one for all the smaller solar flares.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/if_params.png?raw=true)
  d. You can now check that the node is working and returning the expected date: select **Execute step** to run the node manually. n8n tests the data against the condition, and shows which results match true or false in the **OUTPUT** panel.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/if_branch.png?raw=true)
- 4-5) Once you are happy the node will return some events, you can close the node to return to the canvas.
  ![add first step](https://github.com/Elliot518/mcp-oss-tech/blob/main/workflow/n8n/firstworkflow/nasa_with_if.png?raw=true)

&nbsp;

### Step 5: Output data from your workflow

_The last step of the workflow is to send the two reports about solar flares. For this example, you'll send data to [Postbin](https://www.postb.in). Postbin is a service that receives data and displays it on a temporary web page._


