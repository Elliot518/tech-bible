[返回](README.md)

## Salesforce主要技术

<hr>

### 1. 服务

Salesforce.com的客户关系管理(CRM)服务被分成5个大类，包括：Sales Cloud、Service Cloud、Data Cloud（包括Jigsaw）、Collaboration Cloud（包括Chatter）和Custom Cloud（包括Force.com）。


- Salesforce1
>Salesforce1平台汇集了Salesforce.com、Force.com、Heroku和ExactTarget，由此组成了cloud services这个大家庭。

<hr>

- Salesforce.com
>Salesforce.com主要是为企业提供Salesforce1平台，还为企业提供案件管理和任务管理的界面，同时也提供管理自动路由和不断升级的重要事件的系统。Salesforce客户门户还可让客户能够有能力跟踪了解自己的情况，这其中还包括社交插件，能够让用户在加盟Salesforce后，就可在Salesforce提供的社交网站上进行沟通会谈。Salesforce.com还提供分析工具和很多其他服务，包括电子邮件、聊天软件、Google搜索和访问客户的授权与合同。

<hr>

- Force.com
>Force.com是一种云平台即服务(PaaS)，基于社交网络数据，并可延伸至不同移动终端，允许开发者创建多租户附加应用，满足IT部门和独立软件开发商使用不同编程语言研发自己企业的应用。Force.com应用凭借于Salesforce.com的基本结构模式而创建。
Force.com应用程序使用Apex（专有的类似Java的编程语言Force.com）和Visualforce（通常用来生成HTML的XML语法）建成。由于该平台是作为服务提供给开发者的，所以每一个开发的应用还支持更新。

根据2009年9月的Gartner Group 报告，Force.com拥有超过1,000个客户账户。截至2013年，Force.com平台拥有140万注册开发者。

<hr>

- Work.com
>Work.com，以前被称为Rypple，是一个社会绩效管理平台，可以帮助管理者和员工通过不断的培训，实时反馈和认可来提高工作成绩。
它被作为销售业绩、客户服务和市场营销的解决方案，为人力资源部门服务。

_2011年，Rypple为Spotify开发了一种名为OKR（“目标和主要成果”）的更加规范的管理方法。Rypple还与Facebook合作，打造了“Loops”，简称“feedback loops”，其汇集了同事的反馈、感谢、目标进展情况和管理者的教导，由此建立而成的一个“丰富的、健全的、持续的绩效评估”渠道。_

<hr>

- Data.com
>Data.com，以前被称为Jigsaw，是在用户的Salesforce.com帐户中以云端为基础来执行获取和管理CRM记录的自动化系统。
Data.com也是企业和商务人士的在线业务目录，为超过一亿的全球社区用户建立、维护和访问。其也是一个大型的数据库，支持着用户们交换和共享来自超过400万个公司的超过29亿的业务信息。

<hr>

- Desk.com
>Desk.com，以前被称为Assistly，是以云端为基础来与客户交流和解决客户问题的一个服务支持系统。 



Desk.com包括以下功能：
- 多通道功能，用于处理客户请求（知识库、聊天、电子邮件、Twitter等）。
- 一个B2C的通信接口，可作为网络应用程序和移动应用程序来使用。
- 一个专业的联合支援团队，其能更灵活、更周到的解决客户问题。
- 一个可轻松配置系统的管理界面。
- 丰富的分析数据。

<hr>

- Do.com
>Do.com是以云端为基础来为小团体和企业提供任务管理的系统，于2011年推出，终止于2014年。 Salesforce没有提供任何关闭该服务的理由，但它提供了一个导出工具来保存在Do.com中输入的数据。该Do.com域名于2014年卖给了一家新兴公司。

<hr>

- Web services(MuleSoft?)

>除了Web界面，Salesforce.com还提供SOAP/ REST Web服务的API，使之能够与其它系统融合。

&nbsp;

### 2. 技术

#### 2-1) Apex
>Apex是一种类似于Java的专业编程语言，是Force.com平台针对开发者提供的专有编程语言。Apex可以用来在Force.com平台上的大多数进程中执行编程功能，包括：自定义按钮与链接、事件处理程序、更新或删除，同时，也可以通过Visualforce页面的自定义控制器来执行编程功能。

#### 2-2) Visualforce
>Visualforce是Force.com平台上的视图控制技术。这是一个可开/关的标签库，结构和标记与HTML非常相似。Visualforce可连同其它许多尖端技术（例如：HTML5，CSS3和Javascript）来创建一个完整的Salesforce内部自定义页面。 Visualforce的主要优点之一就是与平台的主体特征紧密契合，例如：管理者的方法和数据访问。

#### 2-3) Lightning
>2014年，Salesforce为了响应web界面的快速应用开发了一个新的工具，Salesforce Lightning App Builder。

