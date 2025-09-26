[Back](../README.md)

<hr>

## Message Acknowledge


> In RabbitMQ, Ack (Acknowledgment) is a key mechanism for ensuring that messages are correctly processed by consumers. When Ack is enabled, the consumer must explicitly notify RabbitMQ that the message has been processed before RabbitMQ will delete the message from the queue. If the consumer does not send an Ack and the connection is lost, RabbitMQ will redistribute the message to other consumers.

#### Ack settings are mainly on the consumer side and are controlled in the following two ways:

### 1. Automatic Ack (autoAck = true)


This is the default configuration. Once a message is received by a consumer, RabbitMQ immediately considers it processed and deletes it, without the need for the consumer to manually acknowledge it.


- Risk: 
  If the consumer crashes while processing a message, the message will be lost (because RabbitMQ has deleted it).

  <hr>

- sample code:
  ```java
  // The second parameter is autoAck, true means automatic confirmation
  channel.basicConsume(queueName, true, deliverCallback, cancelCallback);
  ```
&nbsp;

### 2. Manual Ack (autoAck = false)

The Ack method needs to be called explicitly to inform RabbitMQ that the message has been processed. This is recommended for actual production to ensure that the message is not lost.

- Steps:
  1) After receiving a message, the consumer processes the business logic.

  2) If the processing is successful, the consumer calls basicAck to acknowledge the message.

  3) If the processing fails, the consumer calls basicNack or basicReject to requeue or discard the message.

