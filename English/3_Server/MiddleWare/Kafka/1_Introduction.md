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

### 3. xxx

- Maven
```xml
<properties>
    <spring.cloud-version>Hoxton.SR8</spring.cloud-version>
</properties>
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-dependencies</artifactId>
            <version>${spring.cloud-version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

- Gradle
```json
buildscript {
  dependencies {
    classpath "io.spring.gradle:dependency-management-plugin:1.0.10.RELEASE"
  }
}

ext {
  set('springCloudVersion', "Hoxton.SR8")
}

apply plugin: "io.spring.dependency-management"

dependencyManagement {
  imports {
    mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
  }
}
```

&nbsp;

