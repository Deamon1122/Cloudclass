#### Session Video :
    https://drive.google.com/file/d/1nN_hLLWI0psHcZQW4WyGJ-nbhV9Om7kp/view?usp=sharing


#### Packer on Windows

```
STEP-1 : Go to Packer Website & Download Packer Software

    https://developer.hashicorp.com/packer/downloads

    https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_windows_amd64.zip
    
STEP-2 : Unzip the Packer Software

    cd Downloads/

    ls -lrt packer_1.8.6_windows_amd64.zip

    Unzip the file using 7zip 

    ls -lrt packer.exe
    
STEP-3 : Go to Windows C:/Program Files/

Create a folder : Packer 

STEP-4 : Copy packer.exe file from Download Folder to C:/Program Files/Packer/packer.exe

STEP-5 : Setup Environment Variables

User :

    path:  C:/Program Files/Packer/

System :

    path:  C:/Program Files/Packer/

STEP-6 : Close CMD, Powershell & VSCode And Restart Laptop/Desktop

STEP-7 : Verify Packer installation

    $ packer --version
```


#### Packer Linux 

``` Amazon Linux
sudo yum install -y yum-utils shadow-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

sudo yum -y install packer

```

``` Ubuntu
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install packer

```

``` CentOS or RHEL

sudo yum install -y yum-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install packer

```


#### Hashicorp Packer
```
What is Packer?

    - Packer is an open source tool that lets you create identical machine images for multiple platforms from a single source template. 

    - Packer can create golden images to use in image pipelines.
    
    - Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel. 
    
    - Packer does not replace configuration management like Chef or Puppet. 
    
    - In fact, when building images, Packer is able to use tools like Chef or Puppet to install software onto the image.

    - A machine image is a single static unit that contains a pre-configured operating system and installed software which is used to quickly create new running machines. 
    
    - Machine image formats change for each platform. Some examples include AMIs for EC2, VMDK/VMX files for VMware, OVF exports for VirtualBox, etc.
```

#### Creating Machine Images : Packer

-	Getting Started with packer
-	Install Packer on Windows & Linux:
	-	build an Image 
		-	Variables
		-	Builders
		-	Provisioners
		-	Post Provisioners
	-	Executing Shell Scripts
		-	Shell Script 
		-	PowerShell Script
	-	Executing Ansible PlayBooks

#### Download Install & Configure Packer 

    https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli

#### Upgrade Json Code To HCL2:
    https://developer.hashicorp.com/packer/tutorials/configuration-language/hcl2-upgrade
    

#### Variables


.json variable code :

```
{
  "variables": {
    "aws_region": null,
    "aws_secondary_region": "{{ env `AWS_DEFAULT_REGION` }}",
    "aws_secret_key": "",
    "aws_access_key": ""
  },
  "sensitive-variables": ["aws_secret_key", "aws_access_key"]
}

```

#### Builders

```
    - Builders create machines and generate images from those machines for various platforms. 
    
    - Packer also has some builders that perform helper tasks, like running provisioners.

    Packer has the following types of builders:
        1. Plugin: Each plugin has its own associated set of builders. 
            - For example, there are separate builders for EC2, VMware, VirtualBox, etc.
        
        2. File: The file builder creates an artifact from a file.
        
        3. Null: The null builder sets up an SSH connection and runs the provisioners.
    
        4. Custom: You can write new builders for new or existing platforms.
    
        5. Community-Supported: The Packer community develops and maintains builders for several additional platforms.


{
  "type": "null",
  "ssh_host": "127.0.0.1",
  "ssh_username": "foo",
  "ssh_password": "bar"
}


```        

#### Provisioners
```
    - Provisioners use built-in and third-party software to install and configure the machine image after booting. 
    
    Provisioners prepare the system, so you may want to use them for the following use cases:
        
        1. installing packages
        
        2. patching the kernel
        
        3. creating users
        
        4. downloading application code

{
  "builders": [
    {
      "type": "null",
      "name": "example1",
      "communicator": "none"
    },
    {
      "type": "null",
      "name": "example2",
      "communicator": "none"
    }
  ],
  "provisioners": [
    {
      "type": "shell-local",
      "inline": ["echo not overridden"],
      "override": {
        "example1": {
          "inline": ["echo yes overridden"]
        }
      }
    }
  ]
}

```

#### Post-Processors
```
    Post-processors run after builders and provisioners. 
    
    Post-processors are optional, and you can use them to upload artifacts, re-package files, and more. 

Example 1:


{
  "builders": [
    {
      "type": "file",
      "name": "example",
      "target": "./test_artifact.txt",
      "content": "example content"
    }
  ],
  "post-processors": [
    {
      "type": "shell-local",
      "inline": ["echo foo"]
    }
  ]
}



Example-2 :

Example Configuration

This minimal example:

    - Spins up a cloned VMware virtual machine
    
    - Installs a consul release
    
    - Downloads the consul binary
    
    - Packages it into a .tar.gz file
    
    - Uploads it to S3.

{
  "builders": [
    {
      "type": "vmware-vmx",
      "source_path": "/opt/ubuntu-1404-vmware.vmx",
      "ssh_username": "vagrant",
      "ssh_password": "vagrant",
      "shutdown_command": "sudo shutdown -h now",
      "headless": "true",
      "skip_compaction": "true"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sudo apt-get install -y python-pip",
        "sudo pip install ifs",
        "sudo ifs install consul --version=0.5.2"
      ]
    },
    {
      "type": "file",
      "source": "/usr/local/bin/consul",
      "destination": "consul",
      "direction": "download"
    }
  ],
  "post-processors": [
    [
      {
        "type": "artifice",
        "files": ["consul"]
      },
      {
        "type": "compress",
        "output": "consul-0.5.2.tar.gz"
      },
      {
        "type": "shell-local",
        "inline": [
          "/usr/local/bin/aws s3 cp consul-0.5.2.tar.gz s3://<s3 path>"
        ]
      }
    ]
  ]
}


```

#### Packer Commands (CLI)

```
    Packer is controlled using a command-line interface. All interaction with Packer is done via the packer tool. Like many other command-line tools, the packer tool takes a subcommand to execute, and that subcommand may have additional options as well. Subcommands are executed with packer SUBCOMMAND, where "SUBCOMMAND" is the actual command you wish to execute.

    If you run packer by itself, help will be displayed showing all available subcommands and a brief synopsis of what they do. In addition to this, you can run any packer command with the -h flag to output more detailed help for a specific subcommand.

    $ packer init .

    - The packer init command is used to download Packer plugin binaries. 
    - This is the first command that should be executed when working with a new or existing template. This command is always safe to run multiple times.

    - packer init will list all installed plugins then download the latest versions for the ones that are missing.

    - packer init -upgrade will try to get the latest versions for all plugins.


packer {
  required_plugins {
    happycloud = {
      version = ">= 2.7.0"
      source = "github.com/azr/happycloud"
    }
  }
}


    $ packer fix packer.json

    - The packer fix command takes a template and finds backwards incompatible parts of it and brings it up to date so it can be used with the latest version of Packer. 
    
    - After you update to a new Packer release, you should run the fix command to make sure your templates work with the new release.


    $ packer fmt packer.pkr.hcl

    - The packer fmt Packer command is used to format HCL2 configuration files to a canonical format and style. 
    
    - JSON files (.json) are not modified. 
    
    - This command applies a subset of HCL language style conventions, along with other minor adjustments for readability.

    - packer fmt will display the name of the configuration file(s) that need formatting, and write any formatted changes back to the original configuration file(s).

    Example usage:
    Check if configuration file(s) need to be formatted, but don't write the changes.

    $ packer fmt -check .

    Format a configuration file, writing the changes back to the original file.

    $ packer fmt my-template.pkr.hcl
    
    Format a configuration file, reading from stdin and writing to stdout.

    $ packer fmt -

    // You can use pipes to combine this feature with other command line options
    cat my-template.pkr.hcl | packer fmt -

Options
-check - Checks if the input is formatted. Exit status will be 0 if all input is properly formatted and non-zero otherwise.

-diff - Display diffs of any formatting change

-write=false - Don't write formatting changes to source files (always disabled if using -check)

- - read formatting changes from stdin and write them to stdout.


    $ packer inspect packer.json or packer.pkr.hcl

    - The packer inspect command takes a template and outputs the various components a template defines. This can help you quickly learn about a template without having to dive into the HCL itself. The command will tell you things like what variables a template accepts, the builders it defines, the provisioners it defines and the order they'll run, and more.

    - This command is extra useful when used with machine-readable output enabled. The command outputs the components in a way that is parseable by machines.

    - The command doesn't validate the actual configuration of the various components (that is what the validate command is for), but it will validate the syntax of your template by necessity.


    $ packer validate packer.json or packer.pkr.hcl

    The packer validate Packer command is used to validate the syntax and configuration of a template. The command will return a zero exit status on success, and a non-zero exit status on failure. Additionally, if a template doesn't validate, any error messages will be outputted.

    Example usage:

    $ packer validate my-template.pkr.hcl
    $ packer validate packer.json


    $ packer hcl2_upgrade
    The packer hcl2_upgrade Packer command is used to transpile a JSON configuration template to it's formatted HCL2 counterpart.
    
    The command will return a zero exit status on success, and a non-zero exit status on failure.

    Example usage:
    
    $ packer hcl2_upgrade my-template.json

    Successfully created my-template.json.pkr.hcl

    Upgrading variables file
    From v1.7.1, the hcl2_upgrade command can upgrade a variables file.

.json variable code :

{
  "variables": {
    "aws_region": null,
    "aws_secondary_region": "{{ env `AWS_DEFAULT_REGION` }}",
    "aws_secret_key": "",
    "aws_access_key": ""
  },
  "sensitive-variables": ["aws_secret_key", "aws_access_key"]
}

.pkr.hcl variable code :


variable "aws_access_key" {
  type      = string
  default   = ""
  sensitive = true
}

variable "aws_region" {
  type = string
}

variable "aws_secondary_region" {
  type    = string
  default = "${env("AWS_DEFAULT_REGION")}"
}

variable "aws_secret_key" {
  type      = string
  default   = ""
  sensitive = true
}

    Go template functions
    
    hcl2_upgrade will do its best to transform your Go template calls to HCL2, here is the list of calls that should get transformed:

    {{ user `my_var` }} becomes ${var.my_var}.
    
    {{ env `my_var` }} becomes ${var.my_var}. Packer HCL2 supports environment variables through input variables. See docs for more info.
    
    {{ timestamp }} becomes ${local.timestamp}, the local variable will be created for all generated files.
    
    {{ build `ID` }} becomes ${build.ID}.


    Options

    -output-file - Filename of the hcl2 generated template. 
    
    Defaults to JSON_TEMPLATE.pkr.hcl; for example, if the file is called "packerparty.json", the default output-file is "packerparty.json.pkr.hcl".
    
    -with-annotations - Adds helpful comments to the HCL template with information about the generated HCL2 blocks.


    $ packer build packer.json or packer.pkr.json

    - The packer build command takes a template and runs all the builds within it in order to generate a set of artifacts. 
    
    - The various builds specified within a template are executed in parallel, unless otherwise specified. 
    
    - And the artifacts that are created will be outputted at the end of the build.

    Options :
    -except=foo,bar,baz - Run all the builds and post-processors except those with the given comma-separated names. 
    In legacy JSON templates, build names default to the types of their builders (e.g. docker or amazon-ebs or virtualbox-iso), unless a specific name attribute is specified within the configuration. 
    In HCL2 templates, the "name" is the source block's "name" label, unless an in-build source definition adds the "name" configuration option. 
    Any post-processor following a skipped post-processor will not run. 
    Because post-processors can be nested in arrays a different post-processor chain can still run. A post-processor with an empty name will be ignored.

```


#### pkr.hcl Tomcat Example

```

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_aws_account_id" {
  type    = string
  default = "420815905200"
}

variable "applicaiton_name" {
  type    = string
  default = "cloudbinary"
}

variable "application_version" {
  type    = string
  default = "1.0.0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "packer_profile" {
  type    = string
  default = "packer-ec2-s3"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-007855ac798b5175e"
}

# could not parse template for following block: "template: hcl2_upgrade:2: bad character U+0060 '`'"

source "amazon-ebs" "ubuntu" {
  ami_name                    = "tomcloudbinary"
  associate_public_ip_address = "true"
  force_delete_snapshot       = "true"
  force_deregister            = "true"

  instance_type = "t2.micro"
  profile       = "default"
  region        = "us-east-1"
  source_ami    = "ami-007855ac798b5175e"
  ssh_username  = "ubuntu"
  tags = {
    CreatedBy = "Packer"
    Name      = "tom"
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    inline = ["sudo apt-get update",
      "sudo apt-get install software-properties-common -y"
    ]
  }

  provisioner "shell" {
    inline = ["sudo add-apt-repository --yes --update ppa:ansible/ansible", "sudo apt-get install ansible -y"]
  }

  provisioner "shell" {
    inline = ["sudo apt-get install git -y"]
  }

  provisioner "shell" {
    inline = ["sudo apt-get install curl -y"]
  }

  provisioner "shell" {
    inline = ["sudo apt-get install wget -y"]
  }

  provisioner "shell" {
    inline = ["sudo apt-get update", "sudo apt-get install zip -y"]
  }

  #   provisioner "shell" {
  #     execute_command = "sudo -u root /bin/bash -c '{{ .Path }}'"
  #     scripts         = ["awscli.sh"]
  #   }

  #   provisioner "ansible-local" {
  #     extra_arguments = ["-vvvv"]
  #     playbook_file   = "./tomcat-install.yml"
  #   }

  #   provisioner "shell" {
  #     inline = ["sudo aws s3 cp s3://codewithck.com/devops.war /opt/tomcat/webapps/"]
  #   }
}

```

####
    Getting Started :

    https://developer.hashicorp.com/packer/docs/intro

    Docs:
    https://developer.hashicorp.com/tutorials/library?product=packer

    AWS :
    https://developer.hashicorp.com/packer/tutorials/aws-get-started

    Build Image on AWS :
    https://developer.hashicorp.com/packer/tutorials/aws-get-started/aws-get-started-build-image