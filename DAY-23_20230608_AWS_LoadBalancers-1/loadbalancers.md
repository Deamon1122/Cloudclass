# Load Balancers

#### Session Video :
    https://drive.google.com/file/d/14QHt14I7D0-H9PO77v37YPakTGkHYqtv/view?usp=sharing

#### 
    - Application Load Balancer:
        - https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html
        - Layer-7 
        - Port Based
        - Path Based
        - Platform=Mobile --> Redirect To Specific Target Groups
        - Platform=Desktop --> Redirect To Specific Target Groups
        
        Targets:
        - EC2 Instances, Containers, Lambdas, Hybrid Infrastructure

    - Network Load Balancer:
        - https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html
        - Layer-4
        - Forward TCP/UDP Traffic to your instances
        - Handle Millions of request per seconds
        - Less Latency ~ 100 ms ( vs 400 ms for ALB )
        - NLB has one static IP per Availability Zone, and supports assigning Elastic IP
        - NLB are used for extreme performance, TCP/UDP  traffic
        - Target Groups : 
            1. Instances
            2. Private Ipaddress
            3. Application Load Balancer
        - Health Check support the TCP/HTTP & HTTPS protocols

        Targets:
        - EC2 Instances, Containers, Lambdas, Hybrid Infrastructure 

    - Gateway Load Balancer:
        - https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/introduction.html
        - Layer-3
        - Deploy, Scale and Manage a fleet of 3rd party NETWORK VIRTUAL APPLIANCES in AWS 
        - Example : Firewalls, Intrusion Detection and Prevention Systems, Deep Packet Inspection Systems, Payload Manipulation etc..
        - Combines the following functions:
            - Transparent Network Gateway - Single Entry/Exit for all Traffic
            - Load Balancer - Distributes Traffic to your Virtual Appliances
        - Uses the GENEVE protocol on port 6081


#### Application Load Balancer

- STEP-1 : Launch 2 EC2 Instance part of 2 different Availability Zones : 

- While Launching EC2 Instance attach below Script part of User Data:

```
#!/bin/bash

# To Install Web Server 
yum install httpd -y 

# Enable Webserver Deamon at Boot Level & Start the Service 
systemctl enable httpd
systemctl start httpd

# Deploy Simple Code 
echo "<h1><center>Welcome To Cloud Binary - $(hostname -f)</center></h1>" > /var/www/html/index.html
```

- STEP-2 : Create Target Group and Map 2 EC2 Instances

- STEP-3 : Create Load Balancers & Attach Listener i.e. Target Group

- STEP-4 : Test the Load Balancer DNS by going to browser

- STEP-5 : Then, add new RULE part of ALB like path or port based 


#### Network Load Balancer

- STEP-1 : Launch 2 EC2 Instance part of 2 different Availability Zones : 

- While Launching EC2 Instance attach below Script part of User Data:

```
#!/bin/bash

# To Install Web Server 
yum install httpd -y 

# Enable Webserver Deamon at Boot Level & Start the Service 
systemctl enable httpd
systemctl start httpd

# Deploy Simple Code 
echo "<h1><center>Welcome To Cloud Binary - $(hostname -f)</center></h1>" > /var/www/html/index.html
```

- STEP-2 : Create Target Group and Map 2 EC2 Instances

- STEP-3 : Create Load Balancers & Attach Listener i.e. Target Group

- STEP-4 : Test the Load Balancer DNS by going to browser

- STEP-5 : Validate Loadbalancer :
            - You will get Public Ipaddress 
                - http://www.kloth.net/services/nslookup.php

