###STEP 1: SETUP KAFKA

```
# download link:
https://www.apache.org/dyn/closer.cgi?path=/kafka/3.1.0/kafka_2.13-3.1.0.tgz

cd
tar -xzf kafka_2.13-3.1.1.tgz
mv kafka_2.13-3.1.1 /Users/kg/soft/kafka3.1.1
```

&nbsp;

###STEP 2: START THE KAFKA ENVIRONMENT

```
# 1. Start the ZooKeeper service
cd /Users/kg/soft/kafka3.1.1
bin/zookeeper-server-start.sh config/zookeeper.properties 

# 2. Start the Kafka broker service(open another terminal session)
cd /Users/kg/soft/kafka3.1.1
bin/kafka-server-start.sh config/server.properties
```

<hr>

>Once all services have successfully launched, you will have a basic Kafka environment running and ready to use

&nbsp;

###STEP 3: CREATE A TOPIC TO STORE YOUR EVENTS

>Kafka is a distributed event streaming platform that lets you read, write, store, and process
>events (also called records or messages in the documentation) across many machines.

```
  Example events are payment transactions, geolocation updates from mobile phones, shipping orders, 
sensor measurements from IoT devices or medical equipment, and much more. 

  These events are organized and stored in topics. 
  Very simplified, a topic is similar to a folder in a filesystem, 
and the events are the files in that folder.
```

```
cd /Users/kg/soft/kafka-3.1.0
# create topic
bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092

# result
Created topic quickstart-events


# describe topic
bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
# result
---------------------------------------------------------------------------------------------
Topic: quickstart-events	TopicId: 1SARoegwRHeC_pjx17vo1g	PartitionCount: 1	ReplicationFactor: 1	Configs: segment.bytes=1073741824
	Topic: quickstart-events	Partition: 0	Leader: 0	Replicas: 0	Isr: 0
---------------------------------------------------------------------------------------------

```

&nbsp;

###STEP 4: WRITE SOME EVENTS INTO THE TOPIC

```
# write topic(Ctrl-C to break)
bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092

# write message below
>This is my first event
>This is my second event
```

&nbsp;

###STEP 5: READ THE EVENTS

```
cd /Users/kg/soft/kafka-3.1.0

# read topic(Ctrl-C to break)
bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092

# read message below
This is my first event
This is my second event
```

&nbsp;

###STEP 6: TERMINATE THE KAFKA ENVIRONMENT

```
1. Stop the producer and consumer clients with Ctrl-C, if you haven't done so already.
2. Stop the Kafka broker with Ctrl-C.
3. Lastly, stop the ZooKeeper server with Ctrl-C.
```

<hr>

- clear the temp data
>If you also want to delete any data of your local Kafka environment including any events you have created along the way, run the command:
>
>rm -rf /tmp/kafka-logs /tmp/zookeeper
