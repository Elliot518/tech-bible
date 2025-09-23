[Back](README.md)

## Connect to RabbitMQ

<hr>


### 1. How to Connect RabbitMQ in MuleSoft

> MuleSoft uses amqp connector to connect to RabbitMQ

&nbsp;


### 2.Create an exchange in RabbitMQ

![create exchange](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_exchange_rabbitmq.png)


![create exchange1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_exchagne_rabbitmq1.png)

&nbsp;


### 3. Create a queue in RabbitMQ

![create queue](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_queue_rabbitmq.png)

![create queue1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_queue_rabbitmq1.png)

### 4. Bind exchange to the queue

![bind exchange queue1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/bind_exchange_queue1.png)

![bind exchange queue2](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/bind_exchange_queue2.png)

![bind exchange queue3](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/bind_exchange_queue3.png)

&nbsp;

### 5. Add AMQP Connector

![add amqp connector](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/add_amqp_connector.png)

![add amqp connector1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/add_amqp_connector1.png)



&nbsp;

### 6. Create AMQP Config

![create amqp config](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_amqp_config.png)

![create amqp config1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_amqp_config1.png)

&nbsp;

### 7. Publish & Listen Message

#### 7-1) Publish Message

![publish message](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/publish_message.png)

![publish message1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/publish_message1.png)

<hr>

#### 7-2) Listen Message

![listen message](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/listen_message.png)

![listen message1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/listen_message1.png)

&nbsp;

### 8. Broadcasting Message in RabbitMQ

#### 8-1) Create a broadcast exchange
![create broadcast exchange](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_broadcast_exchange.png)

![create broadcast exchange1](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/create_broadcast_exchange1.png)

<hr>

#### 8-2) Create multiple queues
![queue example a](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/queue_example_a.png)

![queue example b](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/queue_example_b.png)

![multiple queues](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/multiple_queues.png)

<hr>

#### 8-3) Bind multiple queues to exchange

![queue example a](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/bind_multiple_queues_to_exchange.png)

&nbsp;

### 9. Code broadcast in MuleSoft

#### 9-1) Set Broadcast Exchange

![set broadcast exchange](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/set_broadcast_exchange.png)

<hr>

#### 9-2) Set Broadcast Queues

![mule queueA](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/mule_queue_a.png)

![mule queueB](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/mule_queue_b.png)

<hr>

#### 9-3) Validate broadcasting message
![mule broadcast](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/mule_broadcast.png)

![mule broadcast](https://raw.githubusercontent.com/Elliot518/mcp-oss-tech/refs/heads/main/mulesoft/rabbitmq/mule_broadcast1.png)
