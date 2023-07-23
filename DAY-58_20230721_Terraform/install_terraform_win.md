#### Session Video
  https://drive.google.com/file/d/17Utjhtoke14CuaptImp6iLBqJ49gsMF0/view?usp=sharing

#### Terraform on Windows

```
STEP-1 : Go to terraform Website & Download terraform Software

    https://developer.hashicorp.com/terraform/downloads

    https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_windows_amd64.zip

    
STEP-2 : Unzip the terraform Software

    cd Downloads/

    ls -lrt terraform_1.5.3_windows_amd64.zip

    Unzip the file using 7zip 

    ls -lrt terraform.exe
    
STEP-3 : Go to Windows C:/Program Files/

Create a folder : Terraform 

STEP-4 : Copy terraform.exe file from Download Folder to C:/Program Files/Terraform/terraform.exe

STEP-5 : Setup Environment Variables

User :

    path:  C:/Program Files/Terraform/

System :

    path:  C:/Program Files/Terraform/

STEP-6 : Close CMD, Powershell & VSCode And Restart Laptop/Desktop

STEP-7 : Verify Terraform installation

    $ terraform --version
```

#### Hashicorp Terraform
```
What is Terraform?
    
    - Terraform is an infrastructure as code tool that lets you build, change, and version infrastructure safely and efficiently. 
    
    - This includes low-level components like compute instances, storage, and networking; and high-level components like DNS entries and SaaS features.

    Hands On: Try the Get Started tutorials to start managing infrastructure on popular cloud providers: 
        1. Amazon Web Services, 
        2. Azure, 
        3. Google Cloud Platform, 
        4. Oracle Cloud Infrastructure, and 
        5. Docker.

```

#### How does Terraform work?

    - Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). 
    
    - Providers enable Terraform to work with virtually any platform or service with an accessible API.

    <image>

    - HashiCorp and the Terraform community have already written thousands of providers to manage many different types of resources and services. 
    
    - You can find all publicly available providers on the Terraform Registry, including Amazon Web Services (AWS), Azure, Google Cloud Platform (GCP), Kubernetes, Helm, GitHub, Splunk, DataDog, and many more.


The core Terraform workflow consists of three stages:

    Write: 
        - You define resources, which may be across multiple cloud providers and services. 
            For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.
    
    Plan: 
        Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.
    
    Apply: 
        On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. 
        
        For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.

    <image>

#### Why Terraform?

    1. Manage any infrastructure :
        
        Find providers for many of the platforms and services you already use in the Terraform Registry. 
        
        You can also write your own. 
        
        Terraform takes an immutable approach to infrastructure, reducing the complexity of upgrading or modifying your services and infrastructure.


    2. Track your infrastructure :
        
        Terraform generates a plan and prompts you for your approval before modifying your infrastructure. 
        
        It also keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. 
        
        Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.


    4. Automate changes :

        Terraform configuration files are declarative, meaning that they describe the end state of your infrastructure. 
        
        You do not need to write step-by-step instructions to create resources because Terraform handles the underlying logic. 
        
        Terraform builds a resource graph to determine resource dependencies and creates or modifies non-dependent resources in parallel. 
        
        This allows Terraform to provision resources efficiently.

    5. Standardize configurations :

        Terraform supports reusable configuration components called modules that define configurable collections of infrastructure, saving time and encouraging best practices. 
        
        You can use publicly available modules from the Terraform Registry, or write your own.

    6. Collaborate :

        Since your configuration is written in a file, you can commit it to a Version Control System (VCS) and use Terraform Cloud to efficiently manage Terraform workflows across teams. 
        
        Terraform Cloud runs Terraform in a consistent, reliable environment and provides secure access to shared state and secret data, role-based access controls, a private registry for sharing both modules and providers, and more.

    7. Community :

        We welcome questions, suggestions, and contributions from the community.

        Ask questions in HashiCorp Discuss.
    
        Read our contributing guide.
    
        Submit an issue for bugs and feature requests.

#### 
    https://developer.hashicorp.com/terraform/tutorials/aws-get-started

#### Download Install & Configure Terraform 

    https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code


#### Here's a table summarizing the major versions of Hashicorp Terraform:

| Version	| Release Date	| Major Changes | 
| --- | --- | --- | 
| 0.1 - 0.11	 | 2014 - 2018	| Basic infrastructure management, HCL v1 |
| 0.12	 | May 2019	| HCL v2, "for_each" resource iteration |
| 0.13	 | Aug 2020	| Configuration validation, variable and expression changes |
| 0.14	 | Nov 2020	| Random value generation, dynamic blocks |
| 0.15	 | May 2021	| Performance improvements, "depends_on" meta-argument |
| 1.0	 | Jun 2021	| Updated CLI, improved error messages, improved backend support, end of support for older features and 
versions |

    - Note that these are just the major versions and there have been many minor releases in between them. 
    
    - It's also worth noting that the syntax and functionality of Terraform can change significantly between major versions, so it's important to pay attention to version compatibility when working with Terraform modules and configurations.


#### To deploy infrastructure with Terraform:

    Scope - Identify the infrastructure for your project.

    Author - Write the configuration for your infrastructure.

    Initialize - Install the plugins Terraform needs to manage the infrastructure.
    
    Plan - Preview the changes Terraform will make to match your configuration.
    
    Apply - Make the planned changes.

#### Install Terraform

    HashiCorp officially maintains and signs packages for the following Linux distributions.

    Ensure that your system is up to date and you have installed the gnupg, software-properties-common, and curl packages installed. 
    
    You will use these packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.

    $ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

    Install the HashiCorp GPG key.

    $ wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

    Verify the key's fingerprint.

    $ gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

    The gpg command will report the key fingerprint:

    $ ls -lrt /usr/share/keyrings/hashicorp-archive-keyring.gpg

    Add the official HashiCorp repository to your system. The lsb_release -cs command finds the distribution release codename for your current system, such as buster, groovy, or sid.

    $ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    Download the package information from HashiCorp.

    $ sudo apt update

    Install Terraform from the new repository.

    $ sudo apt-get install terraform

    Verify the installation :

    Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands.

    $ terraform -help

    Add any subcommand to terraform -help to learn more about what it does and available options.

    $ terraform -help plan

#### Enable tab completion

    If you use either Bash or Zsh, you can enable tab completion for Terraform commands.
    
    To enable autocomplete, first ensure that a config file exists for your chosen shell.

    $ touch ~/.bashrc

    Then install the autocomplete package.

    $ terraform -install-autocomplete


#### Quick start tutorial
    
    Now that you've installed Terraform, you can provision an NGINX server in less than a minute using Docker on Mac, Windows, or Linux. 
    
    You can also follow the rest of this tutorial in your web browser.

    In the working directory, create a file called main.tf and paste the following Terraform configuration into it.

    $ vi main.tf 

```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
```
    Initialize the project, which downloads a plugin called a provider that lets Terraform interact with Docker.

    $ terraform init

    
    Provision the NGINX server container with apply. When Terraform asks you to confirm type yes and press ENTER.

    $ terraform apply

    Verify the existence of the NGINX container by visiting localhost:8000 in your web browser or running docker ps to see the container.

    $ docker ps

    To stop the container, run terraform destroy.

    $ terraform destroy

#### Here are the step-by-step instructions to install Terraform on Windows:

    Go to the Terraform downloads page at https://www.terraform.io/downloads.html and download the appropriate Windows version of Terraform. You can choose between 32-bit and 64-bit versions depending on your system.

    Extract the contents of the downloaded ZIP file to a directory of your choice. 
    
    For example, you can extract it to C:\Program Files\terraform

    Add the Terraform binary to your system's PATH environment variable so that you can run it from any directory. To do this, follow these steps:

    Open the Start menu and search for "environment variables".
    
    Click on "Edit the system environment variables".
    
    Click on the "Environment Variables" button.
    
    Under "System Variables", scroll down until you find the "Path" variable and click on "Edit".
    
    Click on "New" and enter the path to the directory where you extracted the Terraform binary, 
    
    e.g. C:\Program Files\terraform
    
    Click on "OK" to close all the windows.
    
    Open a new command prompt or PowerShell window to ensure that the updated PATH environment variable is loaded.

    Run the terraform command to verify that Terraform is installed correctly. You should see the Terraform help output.

    That's it! You have successfully installed Terraform on Windows. You can now start using Terraform to manage your infrastructure.

#### Here are the step-by-step instructions to install Terraform on Linux:

    Go to the Terraform downloads page at https://www.terraform.io/downloads.html and download the appropriate Linux version of Terraform. 
    
    You can choose between 32-bit and 64-bit versions depending on your system.

    Open a terminal window and navigate to the directory where you downloaded the Terraform binary.

    Unzip the downloaded file using the following command:

    $ unzip terraform_<VERSION>_linux_<ARCH>.zip
    
    Replace <VERSION> with the version number you downloaded, and <ARCH> with either amd64 or 386 depending on your system architecture.

    Move the extracted binary file to a directory in your system's PATH, such as /usr/local/bin, using the following command:

    $ sudo mv terraform /usr/local/bin/

    This will allow you to run Terraform from any directory on your system.

    Verify that Terraform is installed correctly by running the terraform command in a terminal window. You should see the Terraform help output.

    That's it! You have successfully installed Terraform on Linux. You can now start using Terraform to manage your infrastructure.

#### Ubuntu Linux :

  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

  sudo apt update && sudo apt install terraform

#### Here's a sample Terraform code that you can use to launch an EC2 instance on AWS:

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" # replace with your desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```

Here's a brief explanation of what the code does:

The provider block specifies that we're using the AWS provider and sets the region to us-east-1.

The resource block creates an EC2 instance with the specified AMI ID and instance type, and sets a tag with the name 
"example-instance".

To use this code:

    1. Save the code to a file with a .tf extension, such as ec2_instance.tf.

    2. Initialize the Terraform working directory with the command terraform init.

    3. Preview the changes that Terraform will make with the command terraform plan.

    4. Apply the changes to create the EC2 instance with the command terraform apply.

Make sure to replace the ami value with your desired AMI ID. 
You can find AMI IDs for different regions and operating systems on the AWS website.

#### Launch ec2 instance using terraform on aws sample code, along with security group, keypair, userdata

Here's a modified version of the previous Terraform code that includes a security group, keypair, and userdata:

```
provider "aws" {
  region = "us-east-1"
}

# Create a security group that allows SSH access from any IP
resource "aws_security_group" "example_sg" {
  name_prefix = "example-sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a keypair to use for SSH access
resource "aws_key_pair" "example_keypair" {
  key_name   = "example-keypair"
  public_key = file("~/.ssh/id_rsa.pub") # replace with the path to your public key file
}

# Create an EC2 instance with the specified security group, keypair, and userdata
resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" # replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example_keypair.key_name
  user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /home/ec2-user/hello.txt
    EOF

  vpc_security_group_ids = [
    aws_security_group.example_sg.id
  ]

  tags = {
    Name = "example-instance"
  }
}
```

Here's a brief explanation of what the new code does:

    The aws_security_group resource creates a security group that allows SSH access from any IP.

    The aws_key_pair resource creates a keypair to use for SSH access.
    
    The user_data argument in the aws_instance resource specifies a bash script to run when the instance launches. In this case, it creates a file called hello.txt in the home directory of the ec2-user account.
    
    The vpc_security_group_ids argument in the aws_instance resource specifies the security group to associate with the instance.
    
    The key_name argument in the aws_instance resource specifies the name of the keypair to use for SSH access.


To use this code:

    1. Save the code to a file with a .tf extension, such as ec2_instance.tf.

    2. Replace the ami value with your desired AMI ID.
    
    3. Replace the public_key value in the aws_key_pair resource with the path to your public key file.

    4. Initialize the Terraform working directory with the command terraform init.

    5. Preview the changes that Terraform will make with the command terraform plan.
    
    6. Apply the changes to create the EC2 instance with the command terraform apply.

This code creates an EC2 instance with SSH access from any IP, so be sure to modify the security group rules to restrict access as needed.

####
    Getting Started :

    https://developer.hashicorp.com/terraform

    Docs:
    https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

    AWS :
    https://developer.hashicorp.com/terraform/tutorials/aws-get-started
