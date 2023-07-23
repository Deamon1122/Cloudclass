#### Session Video:
    https://drive.google.com/file/d/1r2h-z6eN6CdsWFX2Qe-jddEz_gttkxqJ/view?usp=sharing

# Amazon Elastic File System
    - https://aws.amazon.com/efs/

#### EFS Overview:
    - Amazon Elastic File System is Serverless, fully elastic file storage
    - 5 GB of standard storage for 12 months with the AWS Free Tier
    - Create and configure shared file systems simply and quickly for AWS compute services—no provisioning, deploying, patching, or maintenance required.
    - Eliminate capacity planning with fully elastic storage and performance.
    - Pay only for the storage you use and reduce costs up to 92 percent by automatically moving infrequently accessed files.
    - Securely and reliably access your files with a fully managed file system designed for 99.999999999 percent (11 9s) durability and up to 99.99 percent (4 9s) of availability.

#### How it works:
    - Amazon Elastic File System (EFS) automatically grows and shrinks as you add and remove files with no need for management or provisioning.

    ![How it works](/projects/)

    #![How it works](../../../EFS/cloudbinary_efs.png)

    - Amazon EFS Infrequent Access:
        - https://aws.amazon.com/efs/features/infrequent-access/

#### EFS Pricing:
    - https://aws.amazon.com/efs/pricing/

#### Features & Description 

#### Use cases:
    - Simplify DevOps
        - Share code and other files in a secure, organized way to increase DevOps agility and respond faster to customer feedback.
        - https://aws.amazon.com/blogs/gametech/gearbox-entertainment-goes-remote-with-aws-and-perforce/

    - Modernize application development
        - Persist and share data from your AWS containers and serverless applications with zero management required.
        - https://aws.amazon.com/products/storage/persistent-file-storage-for-modern-apps/?pg=ln&sec=uc

    - Enhance content management systems
        - Simplify persistent storage for modern content management system (CMS) workloads. Get your products and services to market faster, more reliably, and securely at a lower cost.
        - https://pages.awscloud.com/Modernize-Content-Management-Systems-with-EFS-and-AWS-Fargate_2021_0407-CON_OD.html

    - Accelerate data science
        - Easier to use and scale, Amazon EFS offers the performance and consistency needed for machine learning (ML) and big data analytics workloads.
        - https://aws.amazon.com/solutions/case-studies/discover-financial-services-case-study/?pg=ln&sec=uc

#### EFS vs FSx For Windows & FSx For Linux

    - Amazon Elastic File System (EFS), Amazon FSx for Windows File Server, and Amazon FSx for Lustre are all file storage services provided by Amazon Web Services (AWS). Here are some key differences between these services:

        - EFS is a fully managed, scalable file system that is designed to be accessed concurrently by multiple Amazon Elastic Compute Cloud (EC2) instances. 
        - It supports the Network File System (NFS) protocol and is compatible with many Linux-based applications. 
        - It is a good choice for use cases where you need to share files across multiple EC2 instances or have a need for a scalable file system that can grow or shrink automatically based on demand.

        - Amazon FSx for Windows File Server is a fully managed Windows-based file storage service that supports the Server Message Block (SMB) protocol. 
        - It provides features such as access control, file locking, and backups. 
        - It is a good choice for use cases that require Windows-specific features or require integration with Microsoft Active Directory.

        - Amazon FSx for Lustre is a fully managed high-performance file system designed for compute-intensive workloads that require low-latency access to large amounts of data. 
        - It supports the Lustre file system and provides fast data access and high levels of throughput for parallel workloads, such as high-performance computing (HPC), machine learning (ML), and media processing.

    - In terms of pricing, EFS and FSx for Windows are priced based on the amount of storage provisioned, while FSx for Lustre is priced based on the amount of data transferred and the amount of storage provisioned. 
    - Each service has its own set of costs associated with it, such as data transfer costs and additional charges for specific features.

    - In summary, EFS is a scalable, Linux-based file system that supports NFS, FSx for Windows is a Windows-based file storage service that supports SMB, and FSx for Lustre is a high-performance, parallel file system for compute-intensive workloads. 
    - The choice of which service to use depends on the specific requirements of your workload.


#### EFS Hands-On - GUI:
    - https://aws.amazon.com/getting-started/tutorials/create-network-file-system/

#### EFS Hands-On
```
sudo apt-get update 

sudo apt-get install apache2 -y 

echo "EFS Test I am Server-1" > /var/www/html/index.html 

sudo apt-get update

sudo apt-get -y install git binutils

cd /root/

git clone https://github.com/aws/efs-utils

cd e/root/fs-utils/

./build-deb.sh   

sudo apt-get -y install ./build/amazon-efs-utils*deb

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0fb187a5c47e4a9b3.efs.us-east-1.amazonaws.com:/ /var/www/html/

```

#### EFS Hands-On - Terraform

#### EFS Hands-On - Ansible

#### EFS Hands-On - Python

#### EFS Use Case

#### EFS Inteview Questions

#### EFS Quiz 
