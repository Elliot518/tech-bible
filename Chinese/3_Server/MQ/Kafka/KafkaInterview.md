[Back](../../README.md)

### Kafka interview key points

<hr>

### 1. 定义
>Apache Kafka是一个分布式消息队列。具有高性能、持久化、多副本备份、横向扩展能力。生产者往队列里写消息，消费者从队列里取消息进行业务逻辑。一般在架构设计中起到解耦、削峰、异步处理的作用。

&nbsp;

### 2. 核心概念


- Topic

Kafka对外使用topic的概念，生产者往topic里写消息，消费者从读消息。为了做到水平扩展，一个topic实际是由多个partition组成的，遇到瓶颈时，可以通过增加partition的数量来进行横向扩容。单个parition内是保证消息有序。

每新写一条消息，kafka就是在对应的文件append写，所以性能非常高。

总体数据流:
![kafka data flow](kafka_data_flow.png)


##### 图例讲解:
图中有两个topic，topic 0有两个partition，topic 1有一个partition，三副本备份。可以看到consumer gourp 1中的consumer 2没有分到partition处理，这是有可能出现的。

关于broker、topics、partitions的一些元信息用ZooKeeper来存，监控和路由啥的也都会用到zk。

<hr>

- Producer(生产者)

##### 数据流图

![producer data flow](producer_data_flow.png)

创建一条记录，记录中一个要指定对应的topic和value，key和partition可选。先序列化，然后按照topic和partition，放进对应的发送队列中。kafka produce都是批量请求，会积攒一批，然后一起发送，不是调send()就进行立刻进行网络发包。
如果partition没填，那么情况会是这样的：

1、key有填
按照key进行哈希，相同key去一个partition。（如果扩展了partition的数量那么就不能保证了）
2、key没填
round-robin来选partition，这些要发往同一个partition的请求按照配置，攒一波，然后由一个单独的线程一次性发过去。

<hr>

- partition

当存在多副本的情况下，会尽量把多个副本，分配到不同的broker上。kafka会为partition选出一个leader，之后所有该partition的请求，实际操作的都是leader，然后再同步到其他的follower。当一个broker歇菜后，所有leader在该broker上的partition都会重新选举，选出一个leader。（这里不像分布式文件存储系统那样会自动进行复制保持副本数）

partition的分配

1、将所有Broker（假设共n个Broker）和待分配的Partition排序
2、将第i个Partition分配到第（i mod n）个Broker上 （这个就是leader）
3、将第i个Partition的第j个Replica分配到第（(i + j) mode n）个Broker上



