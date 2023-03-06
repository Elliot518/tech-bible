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

