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

### Step 3: Add the NASA node and set up credentials#





