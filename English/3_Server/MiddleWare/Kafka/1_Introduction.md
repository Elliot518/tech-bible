[Back](../README.md)

<hr>

#### More than 80% of all Fortune 100 companies trust, and use Kafka.

### 1. What is Kafka

- Authoritative Definition

  > Apache Kafka is an open-source distributed event streaming platform used by thousands of companies for high-performance data pipelines, streaming analytics, data integration, and mission-critical applications.


&nbsp;

### 2. Core Capabilities

- **HIGH THROUGHPUT**
  Deliver messages at network limited throughput using a cluster of machines with latencies as low as 2ms.

&nbsp;

- **SCALABLE**
  Scale production clusters up to a thousand brokers, trillions of messages per day, petabytes of data, hundreds of thousands of partitions. Elastically expand and contract storage and processing.

&nbsp;

- **PERMANENT STORAGE**
  Store streams of data safely in a distributed, durable, fault-tolerant cluster.

&nbsp;

- **HIGH AVAILABILITY**
  Stretch clusters efficiently over availability zones or connect separate clusters across geographic regions.

&nbsp;

- **BUILT-IN STREAM PROCESSING**
  Process streams of events with joins, aggregations, filters, transformations, and more, using event-time and exactly-once processing.

&nbsp;

- **CONNECT TO ALMOST ANYTHING**
  Kafka’s out-of-the-box Connect interface integrates with hundreds of event sources and event sinks including Postgres, JMS, Elasticsearch, AWS S3, and more.

&nbsp;

### 3. Key Concepts

- **Event Streaming**
  >Event streaming is the practice of capturing data in real-time from event sources like databases, sensors, mobile devices, cloud services, and software applications in the form of streams of events; storing these event streams durably for later retrieval; manipulating, processing, and reacting to the event streams in real-time as well as retrospectively; and routing the event streams to different destination technologies as needed. 
  
  Event streaming ensures a continuous flow and interpretation of data so that the right information is at the right place, at the right time.

&nbsp;

### 4. Installation & Quick Start

##### STEP 1: GET KAFKA

[Download](https://www.apache.org/dyn/closer.cgi?path=/kafka/3.4.0/kafka_2.13-3.4.0.tgz) the latest Kafka release and extract it:
```
$ tar -xzf kafka_2.13-3.4.0.tgz
$ cd kafka_2.13-3.4.0
```

##### STEP 2: START THE KAFKA ENVIRONMENT

_(Apache Kafka can be started using ZooKeeper or KRaft. To get started with either configuration follow one of the sections below but not both.)_

- **Kafka with ZooKeeper**

  1> Start ZK Service
  ```
  # Start the ZooKeeper service
  $ bin/zookeeper-server-start.sh config/zookeeper.properties
  ```

  2> Open another terminal session and run:
  ```
  # Start the Kafka broker service
  $ bin/kafka-server-start.sh config/server.properties
  ```
  Once all services have successfully launched, you will have a basic Kafka environment running and ready to use.

  <hr>

- **Kafka with KRaft**

  1> Generate a Cluster UUID
  ```
  $ KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
  ```

  2> Format Log Directories
  ```
  $ bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties
  ```

  3> Start the Kafka Server
  ```
  $ bin/kafka-server-start.sh config/kraft/server.properties
  ```

  Once the Kafka server has successfully launched, you will have a basic Kafka environment running and ready to use.

##### STEP 3: CREATE A TOPIC TO STORE YOUR EVENTS

- What are events?
  >Events are something like payment transactions, geolocation updates from mobile phones, shipping orders, sensor measurements from IoT devices or medical equipment, and much more.

  Events are organized and stored in topics.

  1> Create an example topic

  Open another terminal session and run:
  ```
  $ bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
  ```

  2> Display the specified topic information

  ```
  $ bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
  ```
  Result:
  Topic: quickstart-events        TopicId: NPmZHyhbR9y00wMglMH2sg PartitionCount: 1       ReplicationFactor: 1	Configs:
    Topic: quickstart-events Partition: 0    Leader: 0   Replicas: 0 Isr: 0

##### STEP 4: WRITE SOME EVENTS INTO THE TOPIC

_A Kafka client communicates with the Kafka brokers via the network for writing (or reading) events. Once received, the brokers will store the events in a durable and fault-tolerant manner for as long as you need—even forever._

Run the console producer client to write a few events into your topic
_(Use Ctrl-C to stop the producer client)_
```
$ bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
This is my first event
This is my second event
```

##### STEP 5: READ THE EVENTS

Open another terminal session and run the console consumer client to read the events you just created:
_(Use Ctrl-C to stop the consumer client)_
```
$ bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```
Result:
This is my first event
This is my second event

##### STEP 6: IMPORT/EXPORT YOUR DATA AS STREAMS OF EVENTS WITH KAFKA CONNECT

- What is Kafka Connect
>Kafka Connect allows you to continuously ingest data from external systems(eg: relational databases or traditional messaging systems) into Kafka, and vice versa.

_It is an extensible tool that runs connectors, which implement the custom logic for interacting with an external system._

##### STEP 7: PROCESS YOUR EVENTS WITH KAFKA STREAMS

WordCount Example:

```java
KStream<String, String> textLines = builder.stream("quickstart-events");

KTable<String, Long> wordCounts = textLines
            .flatMapValues(line -> Arrays.asList(line.toLowerCase().split(" ")))
            .groupBy((keyIgnored, word) -> word)
            .count();

wordCounts.toStream().to("output-topic", Produced.with(Serdes.String(), Serdes.Long()));
```

##### STEP 8: TERMINATE THE KAFKA ENVIRONMENT

1. Stop the producer and consumer clients with Ctrl-C, if you haven't done so already.
2. Stop the Kafka broker with Ctrl-C.
3. Lastly, if the Kafka with ZooKeeper section was followed, stop the ZooKeeper server with Ctrl-C.

If you also want to delete any data of your local Kafka environment including any events you have created along the way, run the command:
```
$ rm -rf /tmp/kafka-logs /tmp/zookeeper /tmp/kraft-combined-logs
```

&nbsp;

### 5. Install by docker

- Using JVM Based Apache Kafka Docker Image
  ```
  # Get the Docker image
  docker pull apache/kafka:4.1.0

  # Get the Docker image
  docker run -p 9092:9092 apache/kafka:4.1.0
  ```
