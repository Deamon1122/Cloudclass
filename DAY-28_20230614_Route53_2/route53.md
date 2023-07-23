#### Session Video :
    https://drive.google.com/file/d/1u25ijcO2P2UHXKtlQ_-5Haq9Y54xcOCW/view?usp=sharing

#### What is Amazon Route 53?

```
Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. You can use Route 53 to perform three main functions in any combination: domain registration, DNS routing, and health checking.

If you choose to use Route 53 for all three functions, be sure to follow the order below:

1. Register domain names
Your website needs a name, such as example.com. Route 53 lets you register a name for your website or web application, known as a domain name.

For an overview, see How domain registration works.

For a procedure, see Registering a new domain.

For a tutorial that takes you through registering a domain and creating a simple website in an Amazon S3 bucket, see Getting started with Amazon Route 53.

2. Route internet traffic to the resources for your domain
When a user opens a web browser and enters your domain name (example.com) or subdomain name (acme.example.com) in the address bar, Route 53 helps connect the browser with your website or web application.

For an overview, see How internet traffic is routed to your website or web application.

For procedures, see Configuring Amazon Route 53 as your DNS service.

For a procedure on how to route email to Amazon WorkMail, see Routing traffic to Amazon WorkMail.

3. Check the health of your resources
Route 53 sends automated requests over the internet to a resource, such as a web server, to verify that it's reachable, available, and functional. You also can choose to receive notifications when a resource becomes unavailable and choose to route internet traffic away from unhealthy resources.

For an overview, see How Amazon Route 53 checks the health of your resources.

For procedures, see Creating Amazon Route 53 health checks and configuring DNS failover.

```

#### How domain registration works

```
If you want to create a website or a web application, you start by registering the name of your website, known as a domain name. Your domain name is the name, such as example.com, that your users enter in a browser to display your website.

Here's an overview of how you register a domain name with Amazon Route 53:

You choose a domain name and confirm that it's available, meaning that no one else has registered the domain name that you want.

If the domain name you want is already in use, you can try other names or try changing only the top-level domain, such as .com, to another top-level domain, such as .ninja or .hockey. For a list of the top-level domains that Route 53 supports, see Domains that you can register with Amazon Route 53.

You register the domain name with Route 53. When you register a domain, you provide names and contact information for the domain owner and other contacts.

When you register a domain with Route 53, the service automatically makes itself the DNS service for the domain by doing the following:

Creates a hosted zone that has the same name as your domain.

Assigns a set of four name servers to the hosted zone. When someone uses a browser to access your website, such as www.example.com, these name servers tell the browser where to find your resources, such as a web server or an Amazon S3 bucket. (Amazon S3 is object storage for storing and retrieving any amount of data from anywhere on the web. A bucket is a container for objects that you store in S3.)

Gets the name servers from the hosted zone and adds them to the domain.

For more information, see How internet traffic is routed to your website or web application.

At the end of the registration process, we send your information to the registrar for the domain. The domain registrar is either Amazon Registrar, Inc. or our registrar associate, Gandi. To find out who the registrar is for your domain, see Finding your registrar.

The registrar sends your information to the registry for the domain. A registry is a company that sells domain registrations for one or more top-level domains, such as .com.

The registry stores the information about your domain in their own database and also stores some of the information in the public WHOIS database.

For more information about how to register a domain name, see Registering a new domain.

If you already registered a domain name with another registrar, you can choose to transfer the domain registration to Route 53. This isn't required to use other Route 53 features. For more information, see Transferring registration for a domain to Amazon Route 53.
```

#### How internet traffic is routed to your website or web application
```
All computers on the internet, from your smart phone or laptop to the servers that serve content for massive retail websites, communicate with one another by using numbers. These numbers, known as IP addresses, are in one of the following formats:

Internet Protocol version 4 (IPv4) format, such as 192.0.2.44

Internet Protocol version 6 (IPv6) format, such as 2001:0db8:85a3:0000:0000:abcd:0001:2345

When you open a browser and go to a website, you don't have to remember and enter a long string of characters like that. Instead, you can enter a domain name like example.com and still end up in the right place. A DNS service such as Amazon Route 53 helps to make that connection between domain names and IP addresses.

```

#### Overview of how you configure Amazon Route 53 to route internet traffic for your domain

```
Here's an overview of how to use the Amazon Route 53 console to register a domain name and configure Route 53 to route internet traffic to your website or web application.

You register the domain name that you want your users to use to access your content. For an overview, see How domain registration works.

After you register your domain name, Route 53 automatically creates a public hosted zone that has the same name as the domain. For more information, see Working with public hosted zones.

To route traffic to your resources, you create records, also known as resource record sets, in your hosted zone. Each record includes information about how you want to route traffic for your domain, such as the following:

Name
The name of the record corresponds with the domain name (example.com) or subdomain name (www.example.com, retail.example.com) that you want Route 53 to route traffic for.

The name of every record in a hosted zone must end with the name of the hosted zone. For example, if the name of the hosted zone is example.com, all record names must end in example.com. The Route 53 console does this for you automatically.

Type
The record type usually determines the type of resource that you want traffic to be routed to. For example, to route traffic to an email server, you specify MX for Type. To route traffic to a web server that has an IPv4 IP address, you specify A for Type.

Value
Value is closely related to Type. If you specify MX for Type, you specify the names of one or more email servers for Value. If you specify A for Type, you specify an IP address in IPv4 format, such as 192.0.2.136.

For more information about records, see Working with records.

You can also create special Route 53 records, called alias records, that route traffic to Amazon S3 buckets, Amazon CloudFront distributions, and other AWS resources. For more information, see Choosing between alias and non-alias records and Routing internet traffic to your AWS resources.

For more information about routing internet traffic to your resources, see Configuring Amazon Route 53 as your DNS service.

```

#### How Amazon Route 53 routes traffic for your domain

```
After you configure Amazon Route 53 to route your internet traffic to your resources, such as web servers or Amazon S3 buckets, here's what happens in just a few milliseconds when someone requests content for www.example.com:

A user opens a web browser, enters www.example.com in the address bar, and presses Enter.

The request for www.example.com is routed to a DNS resolver, which is typically managed by the user's internet service provider (ISP), such as a cable internet provider, a DSL broadband provider, or a corporate network.

The DNS resolver for the ISP forwards the request for www.example.com to a DNS root name server.

The DNS resolver forwards the request for www.example.com again, this time to one of the TLD name servers for .com domains. The name server for .com domains responds to the request with the names of the four Route 53 name servers that are associated with the example.com domain.

The DNS resolver caches (stores) the four Route 53 name servers. The next time someone browses to example.com, the resolver skips steps 3 and 4 because it already has the name servers for example.com. The name servers are typically cached for two days.

The DNS resolver chooses a Route 53 name server and forwards the request for www.example.com to that name server.

The Route 53 name server looks in the example.com hosted zone for the www.example.com record, gets the associated value, such as the IP address for a web server, 192.0.2.44, and returns the IP address to the DNS resolver.

The DNS resolver finally has the IP address that the user needs. The resolver returns that value to the web browser.

Note
The DNS resolver also caches the IP address for example.com for an amount of time that you specify so that it can respond more quickly the next time someone browses to example.com. For more information, see time to live (TTL).

The web browser sends a request for www.example.com to the IP address that it got from the DNS resolver. This is where your content is, for example, a web server running on an Amazon EC2 instance or an Amazon S3 bucket that's configured as a website endpoint.

The web server or other resource at 192.0.2.44 returns the web page for www.example.com to the web browser, and the web browser displays the page.

```

#### Choosing a routing policy

```
When you create a record, you choose a routing policy, which determines how Amazon Route 53 responds to queries:

Simple routing policy – Use for a single resource that performs a given function for your domain, for example, a web server that serves content for the example.com website. You can use simple routing to create records in a private hosted zone.

Failover routing policy – Use when you want to configure active-passive failover. You can use failover routing to create records in a private hosted zone.

Geolocation routing policy – Use when you want to route traffic based on the location of your users. You can use geolocation routing to create records in a private hosted zone.

Geoproximity routing policy – Use when you want to route traffic based on the location of your resources and, optionally, shift traffic from resources in one location to resources in another.

Latency routing policy – Use when you have resources in multiple AWS Regions and you want to route traffic to the region that provides the best latency. You can use latency routing to create records in a private hosted zone.

IP-based routing policy – Use when you want to route traffic based on the location of your users, and have the IP addresses that the traffic originates from.

Multivalue answer routing policy – Use when you want Route 53 to respond to DNS queries with up to eight healthy records selected at random. You can use multivalue answer routing to create records in a private hosted zone.

Weighted routing policy – Use to route traffic to multiple resources in proportions that you specify. You can use weighted routing to create records in a private hosted zone.
```

#### How Amazon Route 53 checks the health of your resources

```
Amazon Route 53 health checks monitor the health of your resources such as web servers and email servers. You can optionally configure Amazon CloudWatch alarms for your health checks, so that you receive notification when a resource becomes unavailable.

Here's an overview of how health checking works if you want to be notified when a resource becomes unavailable:

You create a health check and specify values that define how you want the health check to work, such as the following:

The IP address or domain name of the endpoint, such as a web server, that you want Route 53 to monitor. (You can also monitor the status of other health checks, or the state of a CloudWatch alarm.)

The protocol that you want Amazon Route 53 to use to perform the check: HTTP, HTTPS, or TCP.

How often you want Route 53 to send a request to the endpoint. This is the request interval.

How many consecutive times the endpoint must fail to respond to requests before Route 53 considers it unhealthy. This is the failure threshold.

Optionally, how you want to be notified when Route 53 detects that the endpoint is unhealthy. When you configure notification, Route 53 automatically sets a CloudWatch alarm. CloudWatch uses Amazon SNS to notify users that an endpoint is unhealthy.

Route 53 starts to send requests to the endpoint at the interval that you specified in the health check.

If the endpoint responds to the requests, Route 53 considers the endpoint to be healthy and takes no action.

If the endpoint doesn't respond to a request, Route 53 starts to count the number of consecutive requests that the endpoint doesn't respond to:

If the count reaches the value that you specified for the failure threshold, Route 53 considers the endpoint unhealthy.

If the endpoint starts to respond again before the count reaches the failure threshold, Route 53 resets the count to 0, and CloudWatch doesn't contact you.

If Route 53 considers the endpoint unhealthy and if you configured notification for the health check, Route 53 notifies CloudWatch.

If you didn't configure notification, you can still see the status of your Route 53 health checks in the Route 53 console. For more information, see Monitoring health check status and getting notifications.

If you configured notification for the health check, CloudWatch triggers an alarm and uses Amazon SNS to send notification to the specified recipients.

In addition to checking the health of a specified endpoint, you can configure a health check to check the health of one or more other health checks so that you can be notified when a specified number of resources, such as two web servers out of five, are unavailable. You can also configure a health check to check the status of a CloudWatch alarm so that you can be notified on the basis of a broad range of criteria, not just whether a resource is responding to requests.

If you have multiple resources that perform the same function, for example, web servers or database servers, and you want Route 53 to route traffic only to the resources that are healthy, you can configure DNS failover by associating a health check with each record for that resource. If a health check determines that the underlying resource is unhealthy, Route 53 routes traffic away from the associated record.

For more information about using Route 53 to monitor the health of your resources, see Creating Amazon Route 53 health checks and configuring DNS failover.

```

#### Amazon Route 53?

```
https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html
```