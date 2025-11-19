[Back](README.md)

## AWS EC2

<hr>


### 1. What is AWS EC2

> Amazon Elastic Compute Cloud aka Amazon EC2 is a web service that allows users to lease virtual servers, known as instances, for running workloads and applications within the AWS ecosystem.

#### Amazon EC2 is a web service offered by AWS to rent servers on a pay-as-you-go basis.

_EC2 allows businesses to quickly deploy, scale, and manage applications in the AWS cloud. 
EC2 streamlines IT operations by eliminating the need for purchasing physical hardware and reducing the time and effort required for infrastructure management._

Amazon EC2 has been instrumental in the transformation of computing. By significantly reducing the complexities of handling physical servers, EC2 allows developers to very much concentrate on writing code and creating innovative solutions without worrying about the underlying infrastructure.

&nbsp;

### 2. Benefits of EC2

- **Cost efficiency**
  One of the most compelling benefits of EC2 is the cost efficiency. With a **pay-as-you-go** pricing model, users only pay for the computing resources they use, eliminating the need for upfront investments in hardware or long-term commitments. This model simply allows organizations to adjust their computing resource flexibly to match their actual demand without pre-planning extensively.
  - **On-Demand Instances**
    Allow you to pay for an hour or second, with no long-term commitments.

  - **Reserved Instances** 
    Let you reserve an instance for a specific period (say, one or three years) at a discounted price.  

  - **Spot Instances**
    Enable you to bid for unused EC2 capacity and can provide significant cost savings for workloads that can tolerate interruptions.

- **Scalability and flexibility**
  EC2 allow users to quickly scale their resources up or down based on demand. 
  This benefit is particularly useful for businesses that experience fluctuating workloads or seasonal peaks in traffic. It enables them to handle these situations without overprovisioning or underutilizing resources.

  Amazon EC2 also offers a wide array of instance types, with each of them designed to cater to 
  specific workload types, such as **memory optimized** or **compute-intensive** tasks. This makes it very flexible for users to choose the most suitable instances for their needs, ensuring optimal performance and cost efficiency.

- **High availability and reliability**
  
  EC2 is built on top of a highly available infrastructure, ensuring a highly available and reliable computing environment for applications hosted in the cloud.

  Inside a region, there are multiple data centers clustered together to form an availability 
  zone, and there are multiple availability zones in the region. This similar setup is spread across different geographic regions (see AWS Global Infrastructure at https://aws.amazon.com/about-aws/global-infrastructure/), enabling EC2 to provide redundancy and fault tolerance ensuring that your application remains up and running even in the face of hardware failures or other issues.


  Furthermore, Amazon EC2 also offers advanced features such as **auto-scaling** and **Elastic Load Balancing**, which help distribute incoming traffic and automatically scale instances based on predefined conditions.

- **Security**
  several built-in features and tools to help you safeguard your data and applications：
  - Amazon **VPC**
    Create a private and isolated section of the AWS cloud.
    _Allows you to launch EC2 inside the custom network with custom network access control lists._
  - **Security groups**
    Allow you to **control inbound and outbound traffic to your instance**s** and securely access them using SSH or RDP.
  - **identity and access management (IAM)** 
    Ensure that only authorized personnel can access your EC2 resources.

- **AWS Global Infrastructure**
  https://aws.amazon.com/about-aws/global-infrastructure/


