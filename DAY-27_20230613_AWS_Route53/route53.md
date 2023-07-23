#### Session Video :

# Amazon Route 53

#### Overview:
    - A reliable and cost-effective way to route end users to Internet applications
    - Route end users to your site reliably with globally-dispersed Domain Name System (DNS) servers and automatic scaling.
    - Set up your DNS routing in minutes with domain name registration and straightforward visual traffic flow tools.
    - Customize your DNS routing policies to reduce latency, improve application availability, and maintain compliance.

#### How it works:
    - Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. Route 53 connects user requests to internet applications running on AWS or on-premises.

#### Amazon Route 53 features
    - https://aws.amazon.com/route53/features/

#### Pricing:
    - https://aws.amazon.com/route53/pricing/

### Use cases:
    - Manage network traffic globally:
        - Create, visualize, and scale complex routing relationships between records and policies with easy-to-use global DNS features.

    - Build highly available applications
        - Set routing policies to pre-determine and automate responses in case of failure, like redirecting traffic to alternative Availability Zones or Regions

    - Set up private DNS
        - Assign and access custom domain names in your Amazon Virtual Private Cloud (VPC). 
        - Use internal AWS resources and servers without exposing DNS data to the public Internet.

#### Hands-On - GUI:
    - https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html

#### Routing policies
    Amazon Route 53 is a Domain Name System (DNS) web service that provides routing policies to help users manage traffic flow for their domain names. 
    Here are the routing policies available in Route 53 hosted zones:

    Simple routing: 
    - This policy is used when you have a single resource that performs the function for your domain. 
    - You can create a Route 53 record that maps your domain name to the IP address of the resource.

    Weighted routing: 
    - This policy is used when you have multiple resources that perform the function for your domain and want to distribute traffic across them in proportion to their weight. 
    - You can create multiple Route 53 records that map your domain name to the IP addresses of the resources and specify the weights for each record.

    Latency-based routing: 
    - This policy is used when you have resources in multiple AWS regions and want to route traffic to the region that provides the lowest latency. 
    - You can create multiple Route 53 records that map your domain name to the IP addresses of the resources in each region and specify the latencies for each record.

    Failover routing: This policy is used when you have resources in different locations and want to failover traffic to a backup resource in the event of a failure. 
    - You can create a primary and a secondary Route 53 record that map your domain name to the IP addresses of the primary and backup resources respectively. 
    - Route 53 automatically monitors the health of the primary resource and fails over traffic to the backup resource when necessary.

    Geolocation routing: 
    - This policy is used when you have resources in different geographic locations and want to route traffic based on the location of the user. 
    - You can create multiple Route 53 records that map your domain name to the IP addresses of the resources in each geographic location and specify the geographic locations for each record.

    Multi-value answer routing: 
    - This policy is used when you have multiple resources that perform the function for your domain and want to route traffic to multiple resources. 
    - Route 53 responds to DNS queries with up to eight healthy records selected at random from a list of resources that you specify.

    In summary, Route 53 provides a variety of routing policies that enable users to manage traffic flow for their domain names based on various criteria such as weight, latency, failover, geolocation, and more.


#### Hands-On - CLI:
    -

#### Hands-On - Terraform
    -

#### Hands-On - Ansible
    -

#### Hands-On - Python
    -

#### EFS Inteview Questions
    -

#### EFS Quiz
    -
    