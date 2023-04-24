[Back](README.md)

## Deploy the API to CloudHub

<hr>


### 1. Deploy API to CloudHub

1. From Studio, right-click the project, select [Anypoint Platform > Deploy to CloudHub]

2. Sign in and choose SANDBOX

3. Enter hello-world-greeting-firstname-lastname(eg: hello-world-greeting-elliot-gu)

    ![Deploy to CloudHub](deploy_cloud_hub2.png)

4. Click "Open in Browser" to see the status displayed in Runtime Manager

    ![Anypoint Management Center](deploy_cloud_hub3.png)

5. To test the API deployment, send a request from Advanced Rest Client(Postman):

    a. Click Started to display the App url.

    b. Copy the value: hello-world-greeting-elliot-gu.us-e2.cloudhub.io for this example.

    c. In Advanced Rest Client, send a request to the base URI that you just copied. Be sure to add the API endpoint /greeting:
    ```
    GET http://hello-world-greeting-elliot-gu.us-e2.cloudhub.io/api/greeting
    ```

    d. If you see 200 OK and the greeting you specified, The specified message is either too long or too short, then you have successfully deployed the API you created.


