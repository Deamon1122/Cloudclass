#### Session Video :
    https://drive.google.com/file/d/11vAY1cZxNRy0Ld-GNWEj8Dg5r0M_ijRp/view?usp=sharing

#### Docker

#### Containers

#### What is Container?

```
    Containers are a lightweight, portable, and executable package of software that includes everything needed to run an application, including the code, runtime, system tools, libraries, and settings.

    Containers use operating system level virtualization to provide a secure and isolated environment for running applications. They are similar to virtual machines but are more lightweight and efficient since they share the same operating system kernel with the host machine. This makes it possible to run multiple containers on a single host machine and enables rapid deployment and scaling of applications.

    Containers have become increasingly popular in recent years, especially with the rise of microservices architectures, DevOps, and cloud computing. They are commonly used to deploy and manage applications in production, as well as in development and testing environments. Some popular containerization technologies include Docker, Kubernetes, and Apache Mesos.
```

#### Virtualisation vs Containerisation

Virtualization and containerization are two technologies used for running multiple isolated environments on a single physical machine. 

While they have some similarities, they differ in several ways. 

Here's a brief overview of virtualization and containerization:

```
Virtualization:

    - Virtualization is a technology that allows you to create multiple virtual machines (VMs) on a single physical machine. 
    
    - Each VM has its own operating system (OS), and applications can run within each VM as if it were a separate physical machine. 
    
    - Virtualization is often used to consolidate workloads on a single machine and to provide a high level of isolation between applications.
```

```
Containerization:
    
    - Containerization is a technology that allows you to run multiple isolated environments (containers) on a single operating system. 
    
    - Each container shares the same OS kernel, but has its own file system, network interface, and process space. 
    
    - Containers are lightweight, fast, and easy to deploy, and they provide a high level of portability and scalability. 
    
    - Containerization is often used for microservices architectures, where applications are broken down into smaller, independent components.
    
    
```
Here's a comparison of virtualization and containerization in a table format:

|	| Virtualization | Containerization |
|---|---|---|
| Definition | Technology that creates multiple virtual machines (VMs) on a single physical machine, each with its own operating system  | Technology that allows running multiple isolated environments (containers) on a single operating system, sharing the same OS kernel |
| Overhead | Requires a hypervisor to manage VMs, which adds overhead and reduces performance  | Runs directly on the host OS, with minimal overhead |
| Isolation | Provides a high level of isolation between applications, as each VM has its own operating system | Provides a lower level of isolation, as containers share the same operating system, but still provides some level of isolation |
| Portability | Less portable than containers, as VMs require a complete operating system and hardware configuration | More portable than VMs, as containers can be easily moved between different environments, without requiring changes to the underlying operating system |
| Size | Larger in size than containers, as they include a complete operating system	 | Smaller and more lightweight than VMs, as they only include the necessary files and libraries to run the application |


```
In summary, virtualization and containerization are two technologies used for running multiple isolated environments on a single physical machine. 
Virtualization provides a high level of isolation and security, but at the cost of performance and overhead. 
Containerization is lightweight, fast, and portable, but provides a lower level of isolation. 
The choice between the two technologies depends on the specific use case and requirements of the application.

```

#### Different Container Vendors ?
    
    There are several container vendors that offer containerization technologies and services. Some of the popular container vendors are:

    Docker: Docker is one of the most popular containerization platforms that allows developers to package and deploy applications in containers. It provides a set of tools for creating and managing containers, including Docker Engine, Docker Hub, and Docker Compose.

    Kubernetes: Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It provides a set of tools for deploying, scaling, and managing containers, including Kubernetes API, Kubectl, and Kubernetes Dashboard.

    Red Hat OpenShift: Red Hat OpenShift is a container application platform that provides a consistent environment for developing, deploying, and scaling applications. It is based on Kubernetes and provides a set of tools for managing containers, including OpenShift CLI, OpenShift Web Console, and OpenShift Container Storage.

    Amazon Web Services (AWS) Elastic Container Service (ECS): AWS ECS is a fully-managed container orchestration service that makes it easy to deploy, manage, and scale containerized applications. It provides a set of tools for deploying and managing containers, including AWS Management Console, AWS CLI, and AWS CloudFormation.

    Google Kubernetes Engine (GKE): GKE is a fully-managed Kubernetes service that makes it easy to deploy, manage, and scale containerized applications on Google Cloud Platform. It provides a set of tools for deploying and managing containers, including GKE Dashboard, GKE CLI, and GKE API.

#### What is Docker? 

```
    Docker is an open-source platform for building, packaging, and deploying containerized applications. It provides a way to package an application and its dependencies into a single, portable unit called a container, which can run consistently across different computing environments, such as development, testing, and production environments.

    Docker containers use operating system-level virtualization to isolate the application and its dependencies from the underlying system and other applications running on the same host. This allows multiple containers to run on the same host without interfering with each other, and provides a consistent and predictable environment for the application to run in.

    Docker provides a platform for building, sharing, and deploying containerized applications. Docker images, which are a read-only template that includes the application and its dependencies, as well as any configuration settings, can be used to create multiple identical containers that run the same application in different computing environments.

    Docker provides several advantages over traditional deployment technologies, including:

        Portability: Docker containers can be moved between different computing environments, such as between development, testing, and production environments, without requiring any changes to the application or its dependencies.

        Consistency: Docker containers provide a consistent and predictable environment for the application to run in, which helps to reduce issues related to software dependencies and configuration.

        Scalability: Docker containers can be easily scaled up or down to meet changing demands, without requiring changes to the underlying infrastructure.

        Efficiency: Docker containers are lightweight and consume minimal resources, which makes them more efficient than traditional deployment technologies.

    Docker is widely used in modern software development and deployment, especially in cloud-native applications and microservices architectures. It has become a de facto standard for containerization and has a large and active community of developers and users.

```
#### Docker Architecture 

    Docker architecture consists of several components that work together to enable the building, packaging, and deployment of containerized applications. The main components of Docker architecture are:

        1. Docker daemon: This is the core component of Docker architecture, which runs on the host machine and manages the containers. 
            It is responsible for 
            creating, 
            starting, 
            stopping, and 
            deleting containers, 
            as well as managing the images, networks, and volumes used by the containers.

        2. Docker client: This is the command-line interface (CLI) tool used to interact with the Docker daemon. It sends commands to the Docker daemon, which then executes them.

        3. Docker images: Docker images are read-only templates used to create containers. They include the application and its dependencies, as well as any configuration settings. Docker images can be built from a Dockerfile or pulled from a registry, such as Docker Hub.

        4. Docker containers: Docker containers are the runtime instances of Docker images. They are isolated from the host machine and other containers running on the same host. Docker containers can be started, stopped, and deleted using the Docker daemon or the Docker client.

        5. Docker registry: This is a repository for storing and sharing Docker images. Docker Hub is a public registry hosted by Docker, but there are also private registries that can be used to store and share images within an organization.

        6. Docker network: Docker provides a network layer for connecting containers running on the same host or across different hosts. This enables containers to communicate with each other and with other services running in the same network.

    Overall, Docker architecture provides a powerful and flexible platform for building, packaging, and deploying containerized applications. Its modular design and open architecture make it easy to integrate with other tools and technologies, and its large and active community ensures that it continues to evolve and improve over time.


#### Getting Started with Docker

```
To get started with Docker, you can follow these basic steps:

    Install Docker: 
        - The first step is to install Docker on your machine. 
    
        - You can download and install Docker Desktop from the Docker website, which provides a user-friendly interface for managing Docker containers and images on your local machine.

    Learn Docker basics: 
        - Once you have installed Docker, it's important to understand the basics of how Docker works. 
        
        - This includes understanding Docker images and containers, Dockerfiles, and Docker networking. 
        
    Build Docker images: 
        - After you have learned the basics of Docker, you can start building Docker images for your applications. 
        
        - This involves creating a Dockerfile that specifies the dependencies and configuration for your application, and then building the image using the Docker command-line interface.

    Run Docker containers: 
        - Once you have built a Docker image, you can run it as a Docker container. 
        
        - This involves using the Docker run command to start a container from an image, and specifying any configuration options or environment variables required by your application.

    Use Docker Compose: 
        - As your application grows and becomes more complex, you may need to manage multiple Docker containers that work together as a system. 
        
        - Docker Compose is a tool that allows you to define and run multi-container Docker applications, using a YAML file to specify the configuration and dependencies for each container.

    Use Docker in production: 
        - Once you are comfortable with using Docker on your local machine, you can start using Docker in production environments. 
        
        - This involves setting up Docker on your production servers, deploying your Docker images to those servers, and managing the containers using tools such as Kubernetes or Docker Swarm.

Overall, getting started with Docker involves installing Docker, learning the basics, building and running Docker images and containers, using Docker Compose for multi-container applications, and using Docker in production environments. 

With these skills, you can take advantage of the many benefits of Docker, including portability, consistency, scalability, and efficiency.

```

#### Download, Install Docker on Ubutnu:
    https://docs.docker.com/engine/install/ubuntu/

    https://docs.docker.com/get-started/

    https://docs.docker.com/compose/


#### Hands-On Docker :

    - STEP-1 : Launch 1 EC2 Instances in AWS :

```
aws ec2 run-instances --image-id "ami-0557a15b87f6559cf" --count 1 --instance-type t2.medium --key-name "us_east_1_keys" --security-group-ids "sg-09e7a75b97f33d7f1" --subnet-id "subnet-00a07bb8fefdfcfec" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=docker-compose},{Key=Environment,Value=dev}]'

```

    - STEP-2 : Download, Install & Configure Docker on Ubuntu :

```
#!/bin/bash

# Setup Hostname 
hostnamectl set-hostname "docker.cloudbinary.io"

# Configure Hostname unto hosts file 
echo "`hostname -I | awk '{ print $1}'` `hostname`" >> /etc/hosts 

# Update the Ubuntu Local Repository with Online Repository 
sudo apt update 

# Download, Install & Configure Utility Softwares 
sudo apt install git curl unzip tree wget -y 

# Install Docker on Ubuntu Server
sudo apt-get install docker.io -y 

# Enable Docker For Ubuntu User
sudo usermod -aG docker ubuntu

# Grant Access Docker Socket
sudo chmod 777 /var/run/docker.sock

# Enable Docker Services at boot level
sudo systemctl enable docker

# Restart Docker Daemon 
sudo systemctl restart docker

```

#### Docker Commands:

```
    $ docker images

    $ docker ps 

    $ docker ps -a 

    $ docker run -d --name anyname -p 80:80 c3f279d17e0a

    $ docker exec -it container_id /bin/bash

    $ docker commit c3f279d17e0a  kesavkummari/httpd123:1.3.0

    $ docker login

    $ docker images

    $ docker tag 78dcb7cc3f9f kesavkummari/httpd123:2.0.0
 
    $ docker images

    $ docker push kesavkummari/httpd123:2.0.0
```

#### Dockerfile Examples

```

# Download Base Image from hub.docker.com
FROM ubuntu

# Execute Commands
RUN apt-get update 

# Environment Variables
ENV TZ=Asia/Kolkata   

# Update Environment Variable unto File 
RUN echo $TZ > /etc/timezone 

# Download, Install & Configure WebSever i.e. Apache - Apache2 
RUN apt-get install apache2 -y 

# Utils Package 
RUN apt-get install apache2-utils -y 

# Cleanup APT Command 
RUN apt-get clean 

# Enable WebServer Port i.e. HTTP 80/TCP
EXPOSE 80

# Execute WebServer
CMD ["apache2ctl","-D","FOREGROUND"]
```

#### Dockerfile Tomcat Example

```
# Download Base Image from hub.docker.com
FROM ubuntu

# Execute Commands
RUN apt-get update 

# Environment Variables
ENV TZ=Asia/Kolkata  

# Update Environment Variable unto File 
RUN echo $TZ > /etc/timezone 

# Download, Install & Configure 
RUN apt-get update 
RUN apt-get install openjdk-11-jdk -y 
RUN apt-get install wget -y 
RUN apt-get install curl -y 
RUN apt-get install unzip -y 

# Environment Variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Update Environment Variable unto File 
RUN echo $JAVA_HOME >> /etc/environment

# Cleanup APT Command 
RUN apt-get clean 

RUN mkdir /opt/tomcat/

WORKDIR /opt/
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.tar.gz
RUN cd /opt/ && tar -xzf apache-tomcat-8.5.87.tar.gz && rm apache-tomcat-8.5.87.tar.gz
RUN pwd
#RUN apache-tomcat-8.5.87.tar.gz /opt/tomcat/
RUN mv apache-tomcat-8.5.87/* /opt/tomcat/.
RUN ls -lrta /opt/tomcat/conf/tomcat-users.xml


# Take Tomcat Configuration as backup 
RUN cp /opt/tomcat/conf/tomcat-users.xml "/opt/tomcat/conf/tomcat-users.xml_$(date +%F_%R)"

# To delete last line and which contains </tomcat-users>
RUN sed -i '$d' /opt/tomcat/conf/tomcat-users.xml

#Add User & Attach Roles to Tomcat 
RUN echo '<role rolename="manager-gui"/>'  >> /opt/tomcat/conf/tomcat-users.xml
RUN echo '<role rolename="manager-script"/>' >> /opt/tomcat/conf/tomcat-users.xml
RUN echo '<role rolename="manager-jmx"/>'    >> /opt/tomcat/conf/tomcat-users.xml
RUN echo '<role rolename="manager-status"/>' >> /opt/tomcat/conf/tomcat-users.xml
RUN echo '<role rolename="admin-gui"/>'     >> /opt/tomcat/conf/tomcat-users.xml
RUN echo '<role rolename="admin-script"/>' >> /opt/tomcat/conf/tomcat-users.xml
RUN echo '<user username="admin" password="redhat@123" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>' >> /opt/tomcat/conf/tomcat-users.xml
RUN echo "</tomcat-users>" >> /opt/tomcat/conf/tomcat-users.xml

RUN echo '<?xml version="1.0" encoding="UTF-8"?>' > /opt/tomcat/webapps/manager/META-INF/context.xml 
RUN echo '<Context antiResourceLocking="false" privileged="true" >' >> /opt/tomcat/webapps/manager/META-INF/context.xml 
RUN echo '</Context>' >> /opt/tomcat/webapps/manager/META-INF/context.xml 

RUN echo '<?xml version="1.0" encoding="UTF-8"?>' > /opt/tomcat/webapps/host-manager/META-INF/context.xml 
RUN echo '<Context antiResourceLocking="false" privileged="true" >' >> /opt/tomcat/webapps/host-manager/META-INF/context.xml 
RUN echo '</Context>' >> /opt/tomcat/webapps/host-manager/META-INF/context.xml 

WORKDIR /opt/tomcat/webapps
# RUN curl -O -L https://github.com/kesavkummari/devops/blob/master/target/devops-1.0.0-SNAPSHOT.war

COPY ./cloudops.war /opt/tomcat/webapps/

# Enable WebServer Port i.e. HTTP 80/TCP
EXPOSE 8080

# Execute WebServer
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

```
#### Docker Compose - Sample Python Project

https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/

```
#!/bin/bash

# Setup Hostname
hostnamectl set-hostname "docker-compose.cloudbinary.io"

# Configure Hostname unto hosts file 
echo "`hostname -I | awk '{ print $1}'` `hostname`" >> /etc/hosts 

# Update Ubuntu Operating System Repository
sudo apt-get update

# Download, Install & Configure Utility Softwares 
sudo apt-get install git curl unzip tree wget -y 

# Install Docker on Ubuntu Server
sudo apt-get install docker.io -y 

# Install Docker Compose on Ubuntu 
sudo apt-get install docker-compose -y 

# Enable Docker For Ubuntu User
sudo usermod -aG docker ubuntu

# Grant Access Docker Socket
sudo chmod 777 /var/run/docker.sock

# Enable Docker Services at boot level
sudo systemctl enable docker

# Restart Docker Daemon 
sudo systemctl restart docker

```