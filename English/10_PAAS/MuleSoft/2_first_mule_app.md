[Back](README.md)

## Build your first Hello Mule application

<hr>

### 0. Prerequisites

- REST Client
  eg:  Advanced REST Client, Postman, etc.

- Anypoint Platform
  To deploy our first Mule Application, we are going to need an Anypoint Platform account to host our application on CloudHub. You can sign up for a free trial account [here](https://anypoint.mulesoft.com/login/#/signup?apintent=generic).

- Anypoint Studio
  It's MuleSoft’s IDE.
  Anypoint Studio enables you to start building APIs and integrations quickly with hundreds of pre-built connectors, templates, and examples. Download Anypoint Studio [here](https://www.mulesoft.com/lp/dl/anypoint-mule-studio?_gl=1*x4pjtr*_ga*MTg0MTI0MDM3OC4xNjgwMDk2MjI5*_ga_HQLG2N93Q1*MTY4MDA5NjIyOS4xLjEuMTY4MDA5NzQ5MS4wLjAuMA..).

&nbsp;

### 1. Create a new project in Anypoint Studio

File > New > Mule Project

![New Mule Project](https://developer.mulesoft.com/content/media/tutorials/getting-started/hello-mule/image1.png)

<hr>

Mule Project Structure

![Mule Project Structure](https://developer.mulesoft.com/content/media/tutorials/getting-started/hello-mule/image2.jpg)

&nbsp;

### 2. Add and configure the HTTP Listener connector

#### 2-1) How to add new modules/connectors to your Mule Project
Your Mule Palette should already include the HTTP module. If it doesn’t, you can find the HTTP module by clicking on Add Modules, then dragging and dropping the HTTP module from the right side into the left side of the Mule Palette.

![Add Mule Module](https://developer.mulesoft.com/content/media/tutorials/getting-started/hello-mule/image3.gif)
