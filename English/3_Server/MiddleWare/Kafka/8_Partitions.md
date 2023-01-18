###1. Introduction

>All messages with the same key will go to the same partition.

```java
// Here, the key will simply be set to null
ProducerRecord<String, String> record =
        new ProducerRecord<>("CustomerCountry", "USA");
```

```
When the key is null and the default partitioner is used, the record will be sent to one of 
the available partitions of the topic at random. 
A round-robin algorithm will be used to balance the messages among the partitions. 

In addition to the default partitioner, Apache Kafka clients also provide RoundRobin Partitioner 
and UniformStickyPartitioner. These provide random partition assignment and sticky 
random partition assignment even when messages have keys.
```

&nbsp;

###2. Custom partitioner

```java
import org.apache.kafka.clients.producer.Partitioner;
import org.apache.kafka.common.Cluster;
import org.apache.kafka.common.PartitionInfo;
import org.apache.kafka.common.record.InvalidRecordException;
import org.apache.kafka.common.utils.Utils;

public class BananaPartitioner implements Partitioner {
    public void configure(Map<String, ?> configs) {}
    public int partition(String topic, Object key, byte[] keyBytes,
                         Object value, byte[] valueBytes,
                         Cluster cluster) {
        List<PartitionInfo> partitions = cluster.partitionsForTopic(topic);
        int numPartitions = partitions.size();
        if ((keyBytes == null) || (!(key instanceOf String)))
            throw new InvalidRecordException("We expect all messages " +
                "to have customer name as key");

        // Banana will always go to last partition        
        if (((String) key).equals("Banana"))
            return numPartitions - 1; 

        // Other records will get hashed to the rest of the partitions
        return Math.abs(Utils.murmur2(keyBytes)) % (numPartitions - 1);
    }
    public void close() {}
}
```
