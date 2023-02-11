[Back](README.md)

<hr>

### 0. 什么是微服务

- 权威定义
>The term "Microservice Architecture" has sprung up over the last few years to describe a particular way of designing software applications as suites of independently deployable services. 
While there is no precise definition of this architectural style, there are certain common characteristics around organization around business capability, automated deployment, intelligence in the endpoints, and decentralized control of languages and data.
-- Martin Fowler

从Martin Fowler对于微服务的这段定义，我们可以看到微服务有如下主要元素:

- 首先，微服务是一种架构模式(architecture style)
- 其次，微服务是根据业务能力来进行拆分(business capability)
- 每个微服务是自治部署的(automated deployment)
- 微服务之间是通过智能终端进行通讯的(intelligence in the endpoints)
- 微服务对于语言和数据是去中心化的(decentralized control of languages and data)

#### 补充点
微服务可以把旁大的业务系统拆分成细粒度的服务组件，并且我们可以对这些组件进行独立设计、开发、测试和上线部署。

服务拆分是进行微服务化改造的第一步。关于服务拆分业界通行的做法是结合领域驱动建模和主链路规划进行服务拆分。

- 服务拆分和组件化
  一个大型应用拆分成边界清晰的子系统集合(eg: 订单中心、商品中心、优惠券系统等)。

- 独立演进
  拆分后的子应用有自己独立的数据库，独立进行开发和部署，并结合自动化的DevOp和CICD进行时序集成，快速迭代。

- 高可用
  通过服务治理、流量整形、降级熔断、削峰填谷、弹性计算等一系列技术手段，保证业务系统在高并发场景下的高可用性。

&nbsp;

### 1. 什么是Spring Cloud

- 官方定义

  > Spring Cloud是一系列框架的有序集合。它利用Spring Boot的开发便利性巧妙地简化了分布式系统基础设施的开发，如服务发现注册、配置中心、消息总线、负载均衡、断路器、数据监控等，都可以用Spring Boot的开发风格做到一键启动和部署。
  
_Spring Cloud并没有重复制造轮子，它只是将各家公司开发的比较成熟、经得起实际考验的服务框架组合起来，通过Spring Boot风格进行再封装屏蔽掉了复杂的配置和实现原理，最终给开发者留出了一套简单易懂、易部署和易维护的分布式系统开发工具包。_
